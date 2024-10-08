-- Custom snippets for latex

local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

-- condition in_mathzone for snippets to expand only in math context
local tex = {}
tex.in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- line begin condition, wether its the start of a line or not
local line_begin = require('luasnip.extras.expand_conditions').line_begin

-- Regular expressions
-- . all characters
-- %d digits
-- %a letters
-- %w alphanumeric
-- %s white space
-- %) closing parenthesis
-- %} closing curly braces
-- %] closing square brackets
-- ([regex])
-- [^regex] negation

-- return first capture group of a regex
f(function(_, snip)
  return snip.captures[1]
end)
return {
  s({ trig = '([^%w])a;', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, {
    t '\\alpha',
  }),

  -- TODO: Need to be moved to math file

  -- A fun zero subscript snippet

  -- TODO: need to be moved to format file

  -- Top level section usage of line begin condition
  s(
    { trig = 'h1', dscr = 'Top-level section', snippetType = 'autosnippet' },
    fmta([[\section{<>}]], { i(1) }),
    { condition = line_begin } -- set condition in the `opts` table
  ),
  -- SUPERSCRIPT
  s(
    { trig = '([%w%)%]%}])td', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>^{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
}
