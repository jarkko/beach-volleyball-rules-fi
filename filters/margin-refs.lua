-- Pandoc filter to convert margin references
-- Converts inline span with class "refs" and data-refs attribute to margin notes
--
-- Usage in Markdown:
-- Some text.{.refs data-refs="1.1,D1"}
--
-- This repo also frequently uses the marker on its own line:
--   {.refs data-refs="1.1,D1"}
-- In that case Pandoc parses it as a standalone paragraph, so we merge it into
-- the previous paragraph as an inline Span.
--
-- PDF: Converts to LaTeX \marginnote{}
-- HTML: Converts to <span class="margin-ref"> with CSS positioning

local function normalize_quotes(s)
  return (s:gsub('“', '"'):gsub('”', '"'))
end

local function trim(s)
  if not s then
    return ''
  end
  return (s:gsub('^%s+', ''):gsub('%s+$', ''))
end

local function parse_refs_marker(text)
  if not text then
    return nil
  end

  text = normalize_quotes(text)

  -- Allow trailing junk after the closing brace (common in Typst-originated content).
  -- Example:
  --   {.refs data-refs="2.3"}", "D10 (4)")
  local refs = text:match('^%{[^}]*%.refs[^}]*data%-refs%s*=%s*"([^"]*)"[^}]*%}%s*(.*)$')
  local tail = nil
  if refs then
    tail = select(2, text:match('^%{[^}]*%.refs[^}]*data%-refs%s*=%s*"([^"]*)"[^}]*%}%s*(.*)$'))
  else
    refs = text:match('^%{[^}]*%.refs[^}]*data%-refs%s*=%s*([^%s}]+)[^}]*%}%s*(.*)$')
    if refs then
      tail = select(2, text:match('^%{[^}]*%.refs[^}]*data%-refs%s*=%s*([^%s}]+)[^}]*%}%s*(.*)$'))
    end
  end

  if not refs then
    return nil
  end

  refs = trim(refs)
  if tail and tail ~= '' then
    -- Append any extra quoted tokens in the tail as additional refs.
    local extras = {}
    for q in tail:gmatch('"([^"]+)"') do
      q = trim(q)
      if q ~= '' then
        table.insert(extras, q)
      end
    end
    if #extras > 0 then
      if refs == '' then
        refs = table.concat(extras, ',')
      else
        refs = refs .. ',' .. table.concat(extras, ',')
      end
    end
  end

  return refs
end

local function is_block_with_only_refs(block)
  if not block or (block.t ~= 'Para' and block.t ~= 'Plain') then
    return nil
  end
  local text = pandoc.utils.stringify(block)
  return parse_refs_marker(text)
end

function Pandoc(doc)
  local out = {}
  for _, block in ipairs(doc.blocks) do
    local refs_str = is_block_with_only_refs(block)

    if refs_str then
      local span = pandoc.Span({}, pandoc.Attr('', { 'refs' }, { ['data-refs'] = refs_str }))

      local prev = out[#out]
      if prev and (prev.t == 'Para' or prev.t == 'Plain') then
        table.insert(prev.c, pandoc.Space())
        table.insert(prev.c, span)
      else
        table.insert(out, pandoc.Para({ span }))
      end
    else
      table.insert(out, block)
    end
  end

  doc.blocks = out
  return doc
end

function Span(el)
  if el.classes:includes('refs') and el.attributes['data-refs'] then
    local refs_str = el.attributes['data-refs']
    local refs_list = {}

    -- Parse comma-separated references
    for ref in refs_str:gmatch('[^,]+') do
      ref = ref:gsub('^%s*(.-)%s*$', '%1') -- trim whitespace
      table.insert(refs_list, ref)
    end

    -- Format references (assuming rule numbers like "1.1" or diagrams "D1")
    local refs_text = table.concat(refs_list, ', ')

    -- For PDF/LaTeX: use \marginnote
    if FORMAT:match 'latex' or FORMAT:match 'pdf' then
      -- Create LaTeX margin note with links
      local latex_content = '\\marginnote{'
      for i, ref in ipairs(refs_list) do
        if i > 1 then
          latex_content = latex_content .. ', '
        end
        -- Convert to LaTeX hyperref if it's a rule reference
        if ref:match('^D') then
          -- Diagram reference
          local d_num = ref:match('D(%S+)')
          latex_content = latex_content .. '\\hyperref[rule-D' .. d_num .. ']{\\textcolor{blue}{' .. ref .. '}}'
        else
          -- Rule reference
          local rule_num = ref:match('([%d%.]+)')
          if rule_num then
            latex_content = latex_content .. '\\hyperref[rule-' .. rule_num .. ']{\\textcolor{blue}{' .. ref .. '}}'
          else
            latex_content = latex_content .. '\\textcolor{blue}{' .. ref .. '}'
          end
        end
      end
      latex_content = latex_content .. '}'
      return pandoc.RawInline('latex', latex_content)

    -- For HTML: use CSS-positioned span
    elseif FORMAT:match 'html' then
      local html_content = '<span class="margin-ref">'
      for i, ref in ipairs(refs_list) do
        if i > 1 then
          html_content = html_content .. ', '
        end
        -- Create links for HTML
        if ref:match('^D') then
          local d_num = ref:match('D(%S+)')
          html_content = html_content .. '<a href="#rule-D' .. d_num .. '" class="rule-ref">' .. ref .. '</a>'
        else
          local rule_num = ref:match('([%d%.]+)')
          if rule_num then
            html_content = html_content .. '<a href="#rule-' .. rule_num .. '" class="rule-ref">' .. ref .. '</a>'
          else
            html_content = html_content .. '<span class="rule-ref">' .. ref .. '</span>'
          end
        end
      end
      html_content = html_content .. '</span>'
      return pandoc.RawInline('html', html_content)

    else
      -- Fallback: just return the references as text
      return pandoc.Span({pandoc.Str('[' .. refs_text .. ']')}, {class = 'refs'})
    end
  end
end


