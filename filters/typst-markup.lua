-- Pandoc filter to convert a small subset of Typst-style markup embedded in
-- Markdown into Pandoc structures.
--
-- Supported constructs found in this repo:
--   #subrule("8.3", "TITLE")[ ... ]
--   #rule("TERM", "")[ ... ]
--   #r("8.4.4", )[Text...]
--   #table(columns: (...), [a], [b], ...)
--   #label("rule-1.4.2")
--
-- The goal is not full Typst support; just enough so the published HTML/PDF
-- doesn’t leak raw Typst markup.

local function normalize_quotes(s)
  return (s:gsub('“', '"'):gsub('”', '"'))
end

local function trim(s)
  return (s:gsub('^%s+', ''):gsub('%s+$', ''))
end

local function block_text(block)
  return normalize_quotes(pandoc.utils.stringify(block or {}))
end

local function inlines_to_text(inlines)
  local parts = {}
  for _, inline in ipairs(inlines or {}) do
    if inline.t == 'Str' then
      table.insert(parts, inline.c)
    elseif inline.t == 'Code' then
      -- inline.text in newer Pandoc, inline.c in older
      table.insert(parts, inline.text or inline.c or '')
    elseif inline.t == 'Space' then
      table.insert(parts, ' ')
    elseif inline.t == 'SoftBreak' or inline.t == 'LineBreak' then
      table.insert(parts, '\n')
    end
  end
  return normalize_quotes(table.concat(parts))
end

local function is_plain_or_para(block)
  return block and (block.t == 'Para' or block.t == 'Plain')
end

local function is_line_block(block, pattern)
  if not is_plain_or_para(block) then
    return false
  end
  local t = trim(block_text(block))
  return t:match(pattern) ~= nil
end

local function parse_rule_open(line)
  -- Returns kind ('rule'|'subrule') + number + title, or nil
  line = normalize_quotes(trim(line))
  local kind, number, title = line:match('^#(subrule)%(%s*"([^"]+)"%s*,%s*"([^"]*)"%s*%)%s*%[%s*$')
  if kind then
    return { kind = kind, number = number, title = title }
  end

  kind, number, title = line:match('^#(rule)%(%s*"([^"]+)"%s*,%s*"([^"]*)"%s*%)%s*%[%s*$')
  if kind then
    return { kind = kind, number = number, title = title }
  end

  return nil
end

local function skip_ws(text, pos)
  while pos <= #text and text:sub(pos, pos):match('%s') do
    pos = pos + 1
  end
  return pos
end

local function parse_quoted(text, pos)
  pos = skip_ws(text, pos)
  if text:sub(pos, pos) ~= '"' then
    return nil
  end
  pos = pos + 1
  local out = {}
  while pos <= #text do
    local ch = text:sub(pos, pos)
    if ch == '\\' then
      local nextc = text:sub(pos + 1, pos + 1)
      if nextc ~= '' then
        table.insert(out, nextc)
        pos = pos + 2
      else
        pos = pos + 1
      end
    elseif ch == '"' then
      pos = pos + 1
      return table.concat(out), pos
    else
      table.insert(out, ch)
      pos = pos + 1
    end
  end
  return nil
end

local function find_matching_bracket(text, open_pos)
  local depth = 0
  local i = open_pos
  while i <= #text do
    local ch = text:sub(i, i)
    if ch == '[' then
      depth = depth + 1
    elseif ch == ']' then
      depth = depth - 1
      if depth == 0 then
        return i
      end
    end
    i = i + 1
  end
  return nil
end

local function parse_wrapped_block(text, kind)
  text = normalize_quotes(text)
  text = text:gsub('\r\n', '\n')
  local t = trim(text)

  if not t:match('^#' .. kind .. '%s*%(') then
    return nil
  end

  local pos = 2 + #kind
  pos = skip_ws(t, pos)
  if t:sub(pos, pos) ~= '(' then
    return nil
  end
  pos = pos + 1

  local arg1, p1 = parse_quoted(t, pos)
  if not arg1 then
    return nil
  end
  pos = skip_ws(t, p1)
  if t:sub(pos, pos) ~= ',' then
    return nil
  end
  pos = pos + 1

  local arg2, p2 = parse_quoted(t, pos)
  if not arg2 then
    return nil
  end
  pos = skip_ws(t, p2)
  if t:sub(pos, pos) ~= ')' then
    return nil
  end
  pos = pos + 1
  pos = skip_ws(t, pos)
  if t:sub(pos, pos) ~= '[' then
    return nil
  end

  local open_bracket = pos
  local close_bracket = find_matching_bracket(t, open_bracket)
  if not close_bracket then
    return nil
  end

  local body = t:sub(open_bracket + 1, close_bracket - 1)
  local tail = t:sub(close_bracket + 1)

  return {
    number = trim(arg1),
    title = trim(arg2),
    body = body,
    tail = trim(tail),
  }
end

local function parse_r_block(text)
  -- Normalize whitespace and parse the common multi-line form.
  text = normalize_quotes(text)
  text = text:gsub('\r\n', '\n')
  text = text:gsub('\n+', '\n')
  -- Collapse whitespace to simplify matching.
  local compact = text:gsub('%s+', ' ')

  local number, body = compact:match('#r%s*%(%s*"([^"]+)"%s*,?%s*[^%)]*%s*%)%s*%[(.*)%]%s*$')
  if not number then
    number, body = compact:match('#r%s*%(%s*"([^"]+)"%s*%)%s*%[(.*)%]%s*$')
  end
  if not number then
    return nil
  end

  return { number = trim(number), body = trim(body or '') }
end

local function parse_table(text)
  text = normalize_quotes(text)
  local cols = text:match('columns%s*:%s*%(([^%)]*)%)')
  if not cols then
    return nil
  end

  local col_count = 0
  for _ in cols:gmatch('[^,]+') do
    col_count = col_count + 1
  end
  if col_count < 1 then
    return nil
  end

  local cells = {}
  for cell in text:gmatch('%[([^%]]*)%]') do
    table.insert(cells, trim(cell))
  end
  if #cells < col_count then
    return nil
  end

  local header = {}
  for i = 1, col_count do
    table.insert(header, cells[i])
  end

  local rows = {}
  local i = col_count + 1
  while i <= #cells do
    local row = {}
    for j = 1, col_count do
      table.insert(row, cells[i + j - 1] or '')
    end
    table.insert(rows, row)
    i = i + col_count
  end

  return { header = header, rows = rows, col_count = col_count }
end

local function escape_html(s)
  return (s:gsub('&', '&amp;'):gsub('<', '&lt;'):gsub('>', '&gt;'))
end

local function html_table(tbl)
  local parts = { '<table class="rules-table">' }
  table.insert(parts, '<thead><tr>')
  for _, h in ipairs(tbl.header) do
    table.insert(parts, '<th>' .. escape_html(h) .. '</th>')
  end
  table.insert(parts, '</tr></thead>')

  table.insert(parts, '<tbody>')
  for _, row in ipairs(tbl.rows) do
    table.insert(parts, '<tr>')
    for _, cell in ipairs(row) do
      table.insert(parts, '<td>' .. escape_html(cell) .. '</td>')
    end
    table.insert(parts, '</tr>')
  end
  table.insert(parts, '</tbody></table>')
  return table.concat(parts)
end

local function latex_escape(s)
  -- Minimal escaping for table cell text.
  s = s:gsub('\\', '\\\\')
  s = s:gsub('([%%#$&_{}])', '\\%1')
  s = s:gsub('~', '\\textasciitilde{}')
  s = s:gsub('%^', '\\textasciicircum{}')
  return s
end

local function latex_table(tbl)
  local aligns = {}
  for _ = 1, tbl.col_count do
    table.insert(aligns, 'l')
  end
  local spec = table.concat(aligns, '')

  local out = {}
  table.insert(out, '\\begin{center}')
  table.insert(out, string.format('\\begin{tabular}{%s}', spec))
  table.insert(out, '\\toprule')

  table.insert(out, table.concat((function()
    local h = {}
    for _, cell in ipairs(tbl.header) do
      table.insert(h, latex_escape(cell))
    end
    return h
  end)(), ' & ') .. ' \\\\')

  table.insert(out, '\\midrule')

  for _, row in ipairs(tbl.rows) do
    local cells = {}
    for _, cell in ipairs(row) do
      table.insert(cells, latex_escape(cell))
    end
    table.insert(out, table.concat(cells, ' & ') .. ' \\\\')
  end

  table.insert(out, '\\bottomrule')
  table.insert(out, '\\end{tabular}')
  table.insert(out, '\\end{center}')

  return table.concat(out, '\n')
end

local function number_is_safe_rule_label(n)
  -- Allow numbers like 8.4.4 or identifiers like D4a.
  return n:match('^[A-Za-z0-9%.%-]+$') ~= nil
end

local function rule_div(kind, number, title, content)
  local attr = pandoc.Attr('', { kind }, { number = number or '', title = title or '' })
  return pandoc.Div(content or {}, attr)
end

function Pandoc(doc)
  local out = {}
  local i = 1

  while i <= #doc.blocks do
    local b = doc.blocks[i]

    -- Handle multi-line #rule/#subrule blocks
    if is_plain_or_para(b) then
      local t = trim(inlines_to_text(b.c))

      -- Drop a few Typst-only directives/comments that are not meaningful in Pandoc.
      if t:match('^//') or t:match('^#show%s') or t:match('^#v%s*%(') then
        i = i + 1
        goto continue
      end

      -- Handle #subrule(...) [ ... ] even when Pandoc collapsed it into a single paragraph.
      local sub = parse_wrapped_block(t, 'subrule')
      if sub then
        local parsed = pandoc.read(sub.body, 'markdown')
        table.insert(out, rule_div('subrule', sub.number, sub.title, parsed.blocks))
        if sub.tail and sub.tail ~= '' then
          local tail_doc = pandoc.read(sub.tail, 'markdown')
          for _, tb in ipairs(tail_doc.blocks) do
            table.insert(out, tb)
          end
        end
        i = i + 1
        goto continue
      end

      -- Handle #rule(...) [ ... ] similarly.
      local r = parse_wrapped_block(t, 'rule')
      if r then
        local parsed = pandoc.read(r.body, 'markdown')
        if number_is_safe_rule_label(r.number) then
          table.insert(out, rule_div('rule', r.number, r.title, parsed.blocks))
        else
          local body_txt = trim(pandoc.utils.stringify(parsed))
          local para = pandoc.Para({ pandoc.Strong({ pandoc.Str(r.number) }) })
          if body_txt ~= '' then
            table.insert(para.c, pandoc.Str(' — ' .. body_txt))
          end
          table.insert(out, para)
        end
        if r.tail and r.tail ~= '' then
          local tail_doc = pandoc.read(r.tail, 'markdown')
          for _, tb in ipairs(tail_doc.blocks) do
            table.insert(out, tb)
          end
        end
        i = i + 1
        goto continue
      end

      -- Handle multi-line #table(...) blocks
      if t:match('^#table%s*%(') then
        local parts = { t }
        i = i + 1
        while i <= #doc.blocks do
          local bt = trim(block_text(doc.blocks[i]))
          table.insert(parts, bt)
          i = i + 1
          if bt:match('^%)$') then
            break
          end
        end
        local full = table.concat(parts, '\n')
        local tbl = parse_table(full)
        if tbl then
          if FORMAT:match('html') then
            table.insert(out, pandoc.RawBlock('html', html_table(tbl)))
          elseif FORMAT:match('latex') or FORMAT:match('pdf') then
            table.insert(out, pandoc.RawBlock('latex', latex_table(tbl)))
          else
            -- Fallback: keep as plain text
            table.insert(out, pandoc.Para({ pandoc.Str(full) }))
          end
        else
          table.insert(out, pandoc.Para({ pandoc.Str(full) }))
        end
        goto continue
      end

      -- Handle multi-line #r(...) blocks
      if t:match('^#r%s*%(') then
        local parts = { t }
        i = i + 1
        while i <= #doc.blocks and not trim(block_text(doc.blocks[i])):match('%]%s*$') do
          table.insert(parts, trim(block_text(doc.blocks[i])))
          i = i + 1
        end
        if i <= #doc.blocks then
          table.insert(parts, trim(block_text(doc.blocks[i])))
          i = i + 1
        end

        local parsed = parse_r_block(table.concat(parts, '\n'))
        if parsed then
          local label_id = 'rule-' .. parsed.number
          if FORMAT:match('latex') or FORMAT:match('pdf') then
            local inlines = {
              pandoc.RawInline('latex', '\\phantomsection\\label{' .. label_id .. '}'),
              pandoc.Space(),
              pandoc.Strong({ pandoc.Str(parsed.number) }),
            }
            if parsed.body ~= '' then
              table.insert(inlines, pandoc.Space())
              table.insert(inlines, pandoc.Str(parsed.body))
            end
            table.insert(out, pandoc.Para(inlines))
          elseif FORMAT:match('html') then
            local inlines = {
              pandoc.Span({}, pandoc.Attr(label_id, {}, {})),
              pandoc.Strong({ pandoc.Str(parsed.number) }),
            }
            if parsed.body ~= '' then
              table.insert(inlines, pandoc.Space())
              table.insert(inlines, pandoc.Str(parsed.body))
            end
            table.insert(out, pandoc.Para(inlines))
          else
            table.insert(out, pandoc.Para({ pandoc.Strong({ pandoc.Str(parsed.number) }), pandoc.Space(), pandoc.Str(parsed.body) }))
          end
        else
          table.insert(out, b)
        end
        goto continue
      end
    end

    table.insert(out, b)
    i = i + 1

    ::continue::
  end

  doc.blocks = out
  return doc
end

function Para(el)
  -- Convert inline #label("...") tokens into real anchors.
  local out = {}
  local changed = false

  for _, inline in ipairs(el.c) do
    if inline.t == 'Str' then
      local s = normalize_quotes(inline.c)
      local only_id = s:match('^#label%(%s*"([^"]+)"%s*%)$')
      if only_id then
        table.insert(out, pandoc.Span({}, pandoc.Attr(only_id, {}, {})))
        changed = true
      else
        -- Handle cases where #label(...) is embedded in a larger string.
        local pre, id, post = s:match('^(.-)#label%(%s*"([^"]+)"%s*%)(.*)$')
        if id then
          if pre ~= '' then
            table.insert(out, pandoc.Str(pre))
          end
          table.insert(out, pandoc.Span({}, pandoc.Attr(id, {}, {})))
          if post and post ~= '' then
            table.insert(out, pandoc.Str(post))
          end
          changed = true
        else
          table.insert(out, inline)
        end
      end
    else
      table.insert(out, inline)
    end
  end

  if changed then
    return pandoc.Para(out)
  end

  return nil
end
