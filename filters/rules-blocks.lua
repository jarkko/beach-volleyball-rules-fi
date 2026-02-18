-- Pandoc filter to convert custom rule blocks to LaTeX/HTML.
--
-- Source syntax (non-standard Markdown) used in this repo:
--   [rule,number="1",title="PELIALUE"]
--   ====
--   ...content...
--   ====
--
-- Pandoc treats the first "====" as a Setext heading underline, so the marker
-- line becomes a Header. We detect those Headers, gather blocks until the next
-- "====" delimiter, and convert that region into a proper Div with attributes.

local RULE_KINDS = {
  rule = true,
  subrule = true,
  diagram = true,
  case_ = true,
}

local function normalize_quotes(s)
  return (s:gsub('“', '"'):gsub('”', '"'))
end

local function trim(s)
  if not s then
    return ''
  end
  return (s:gsub('^%s+', ''):gsub('%s+$', ''))
end

local function parse_marker(text)
  if not text then
    return nil
  end

  text = trim(normalize_quotes(text))
  local kind, attrs = text:match('^%[(%a+),(.+)%]$')
  if not kind then
    return nil
  end

  kind = kind:lower()
  if kind == 'case' then
    kind = 'case_'
  end
  if not RULE_KINDS[kind] then
    return nil
  end

  local number = attrs:match('number="([^"]+)"') or attrs:match('number=([^,]+)') or ''
  local title = attrs:match('title="([^"]*)"') or attrs:match('title=([^,]+)') or ''

  return {
    kind = kind,
    number = number,
    title = title,
  }
end

local function is_delimiter_block(block)
  if not block or (block.t ~= 'Para' and block.t ~= 'Plain') then
    return false
  end
  local text = trim(normalize_quotes(pandoc.utils.stringify(block)))
  if text:match('^=+$') and #text >= 4 then
    return true
  end
  return false
end

local function marker_from_header(block)
  if not block or block.t ~= 'Header' then
    return nil
  end
  local text = trim(pandoc.utils.stringify(block))
  return parse_marker(text)
end

function Pandoc(doc)
  local out = {}
  local i = 1

  while i <= #doc.blocks do
    local block = doc.blocks[i]
    local marker = marker_from_header(block)

    if marker then
      local content = {}
      i = i + 1

      while i <= #doc.blocks and not is_delimiter_block(doc.blocks[i]) do
        table.insert(content, doc.blocks[i])
        i = i + 1
      end

      -- Consume the closing delimiter if present.
      if i <= #doc.blocks and is_delimiter_block(doc.blocks[i]) then
        i = i + 1
      end

      local kind_class = marker.kind
      if kind_class == 'case_' then
        kind_class = 'case'
      end
      local attr = pandoc.Attr('', { kind_class }, { number = marker.number, title = marker.title })
      table.insert(out, pandoc.Div(content, attr))
    else
      table.insert(out, block)
      i = i + 1
    end
  end

  doc.blocks = out
  return doc
end

local function latex_macro_for(el)
  local number = el.attributes['number'] or ''
  local title = el.attributes['title'] or ''

  if el.classes:includes('rule') then
    return string.format('\\RuleBlock{%s}{%s}', number, title)
  elseif el.classes:includes('subrule') then
    return string.format('\\SubruleBlock{%s}{%s}', number, title)
  elseif el.classes:includes('diagram') then
    return string.format('\\DiagramBlock{%s}{%s}', number, title)
  end

  return nil
end

local function html_title_for(el)
  local number = el.attributes['number'] or ''
  local title = el.attributes['title'] or ''
  if el.classes:includes('diagram') then
    return 'KAAVIO ' .. number .. ': ' .. title
  end
  return number .. ' ' .. title
end

function Div(el)
  if el.classes:includes('rule') or el.classes:includes('subrule') or el.classes:includes('diagram') then
    if FORMAT:match('latex') or FORMAT:match('pdf') then
      local macro = latex_macro_for(el)
      if not macro then
        return nil
      end

      local blocks = { pandoc.RawBlock('latex', macro) }
      for _, b in ipairs(el.content) do
        table.insert(blocks, b)
      end
      return blocks
    end

    if FORMAT:match('html') then
      local title_text = html_title_for(el)
      local title_block = pandoc.Para({ pandoc.Strong({ pandoc.Str(title_text) }) })
      table.insert(el.content, 1, title_block)
      el.attributes['data-rule-number'] = el.attributes['number'] or ''
      el.attributes['data-rule-title'] = el.attributes['title'] or ''
      return el
    end
  end

  if el.classes:includes('case') then
    return nil
  end

  return nil
end


