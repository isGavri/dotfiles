local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
-- local rep = require('luasnip.extras').rep

-- function to surround visual selection with a snippet

-- local get_visual = function(args, parent)
--   if #parent.snippet.env.LS_SELECT_RAW > 0 then
--     return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
--   else -- If LS_SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end

local tex = {}
tex.in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- \frac{<>}{<>}
  s(
    { trig = '//', dscr = 'Expands // into fraction', snippetType = 'autosnippet' },
    fmta([[ \frac{<>}{<>}      ]], { i(1, 'Placeholder'), i(2, 'Placeholder') }),
    { condition = tex.in_mathzone }
  ),
  -- a/ -> \frac{a}{<>}
  s(
    { trig = '([%a])/', dscr = 'Expands [%a]/ into \\frac{[%a]}{}', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[\frac{<><>}{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i '1',
      i '2',
    }),
    { condition = tex.in_mathzone }
  ),
  -- Subscript snippet
  s(
    { trig = '([%a%)%]%}])dt', descr = 'Expands subscripts', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>_{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i '1',
    }),
    { condition = tex.in_mathzone }
  ),
  -- Superscript snippet
  s(
    { trig = '([%a%)%]%}])td', descr = 'Expands superscripts', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>^{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i '1',
    }),
    { condition = tex.in_mathzone }
  ),
}
