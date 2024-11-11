local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- Inline math
  s({ trig = 'mk', descr = 'Inline math', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, fmta([[ \( <> \)]], { i(1) })),
  -- Math block
  s(
    { trig = '([%s])dm', descr = 'Math block', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta(
      [[\[ 
  <>
\] ]],
      { i '1' }
    )
  ),
  -- Align enviroment
  s(
    { trig = '([^%w])ali', descr = 'Align', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta(
      [[\begin(align*)
        <>
      \end(align*)]],
      { i '1' }
    )
  ),
  -- Begin
  s(
    { trig = 'begin', descr = 'Begin enviroment', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta(
      [[\begin(<>)
      <>
      \end(<>)]],
      { i '1', i '2', rep '1' }
    ),
    { condition = line_begin }
  ),
  -- Document
  s(
 { trig = 'doc', descr = 'Document start' },
  ),
  -- Top level section
  s(
    { trig = 'h1', descr = 'Top level section', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[\section{<>}]], { i '1' }),
    { condition = line_begin }
  ),
  -- Mid level section
  s(
    { trig = 'h2', descr = 'Mid level section', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[\subsectionsection{<>}]], { i '1' }),
    { condition = line_begin }
  ),
  -- Bottom level section
  s(
    { trig = 'h3', descr = 'Bottom level section', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta([[\subsubsection{<>}]], { i '1' }),
    { condition = line_begin }
  ),
}
