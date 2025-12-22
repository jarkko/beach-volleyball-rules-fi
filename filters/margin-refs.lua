-- Pandoc filter to convert margin references
-- Converts inline span with class "refs" and data-refs attribute to margin notes
--
-- Usage in Markdown:
-- Some text.{.refs data-refs="1.1,D1"}
--
-- PDF: Converts to LaTeX \marginnote{}
-- HTML: Converts to <span class="margin-ref"> with CSS positioning

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


