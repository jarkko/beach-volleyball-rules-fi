-- Pandoc filter to convert custom rule blocks to LaTeX/HTML
-- Handles: [rule], [subrule], [diagram], [case] blocks

function Div(el)
  -- Rule blocks (main rules like "1", "2", etc.)
  if el.classes:includes('rule') then
    local number = el.attributes['number'] or ''
    local title = el.attributes['title'] or ''

    if FORMAT:match 'latex' or FORMAT:match 'pdf' then
      -- LaTeX: use \rule command
      local content = pandoc.write(pandoc.Pandoc({el}), 'latex')
      return pandoc.RawBlock('latex',
        string.format('\\rule{%s}{%s}%%s', number, title) .. '\n' .. content
      )
    elseif FORMAT:match 'html' then
      -- HTML: use div with class
      el.classes = {'rule', 'rule-block'}
      el.attributes['data-rule-number'] = number
      el.attributes['data-rule-title'] = title
      -- Add rule number and title as first element
      local title_block = pandoc.Div({
        pandoc.Para({pandoc.Strong({pandoc.Str(number .. ' ' .. title)})})
      }, {class = 'rule-title'})
      table.insert(el.content, 1, title_block)
      return el
    end

  -- Subrule blocks (like "1.1", "1.2")
  elseif el.classes:includes('subrule') then
    local number = el.attributes['number'] or ''
    local title = el.attributes['title'] or ''

    if FORMAT:match 'latex' or FORMAT:match 'pdf' then
      local content = pandoc.write(pandoc.Pandoc({el}), 'latex')
      return pandoc.RawBlock('latex',
        string.format('\\subrule{%s}{%s}%%s', number, title) .. '\n' .. content
      )
    elseif FORMAT:match 'html' then
      el.classes = {'subrule', 'subrule-block'}
      el.attributes['data-rule-number'] = number
      el.attributes['data-rule-title'] = title
      local title_block = pandoc.Div({
        pandoc.Para({pandoc.Strong({pandoc.Str(number .. ' ' .. title)})})
      }, {class = 'subrule-title'})
      table.insert(el.content, 1, title_block)
      return el
    end

  -- Diagram blocks
  elseif el.classes:includes('diagram') then
    local number = el.attributes['number'] or ''
    local title = el.attributes['title'] or ''

    if FORMAT:match 'latex' or FORMAT:match 'pdf' then
      local content = pandoc.write(pandoc.Pandoc({el}), 'latex')
      return pandoc.RawBlock('latex',
        string.format('\\diagram{%s}{%s}%%s', number, title) .. '\n' .. content
      )
    elseif FORMAT:match 'html' then
      el.classes = {'diagram', 'diagram-block'}
      el.attributes['data-diagram-number'] = number
      el.attributes['data-diagram-title'] = title
      local title_block = pandoc.Div({
        pandoc.Para({pandoc.Strong({pandoc.Str('KAAVIO ' .. number .. ': ' .. title)})})
      }, {class = 'diagram-title'})
      table.insert(el.content, 1, title_block)
      return el
    end

  -- Case blocks (for casebook)
  elseif el.classes:includes('case') then
    local number = el.attributes['number'] or ''

    if FORMAT:match 'latex' or FORMAT:match 'pdf' then
      -- Handle case formatting
      return el -- Process normally but can add LaTeX wrapper if needed
    elseif FORMAT:match 'html' then
      el.classes = {'case', 'case-block'}
      el.attributes['data-case-number'] = number
      return el
    end
  end

  return nil -- Don't modify if not a recognized block
end


