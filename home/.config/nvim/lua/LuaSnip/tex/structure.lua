local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local line_begin = require('luasnip.extras.expand_conditions').line_begin

return {
  -- *** Math *** --
  -- Inline math
  s(
    {
      trig = '([^%w])mk',
      descr = 'Inline math',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta(
      [[<>\( <> \) ]],
      { f(function(_, snip)
        return snip.captures[1]
      end), i(1) }
    )
  ),
  -- Math block
  s(
    {
      trig = '([^%w])dm',
      descr = 'Math block',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta(
      [[
\[
  <>
\] ]],
      { i(1) }
    )
  ),
  -- Align enviroment
  s(
    {
      trig = 'ali',
      descr = 'Align',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta(
      [[
\begin(align*)
  <>
\end(align*)]],
      { i(1) }
    ),
    { condition = line_begin }
  ),
  -- *** Formatting commands *** --

  -- Bold text
  s(
    {
      trig = '([%s])bf',
      descr = 'Bold text',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta([[<>\textbf{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(2),
    })
  ),

  -- Italic text
  s(
    {
      trig = '([%s])tit',
      descr = 'Italic text',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta([[<>\textit{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(2),
    })
  ),

  -- Underlined text
  s(
    {
      trig = '([%s])ud;',
      descr = 'Underlined text',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta([[<>\underline{<>}]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(2),
    })
  ),

  -- Plots
  s(
    {
      trig = 'plot',
      descr = '2D Pgfplot',
    },
    fmta(
      [[
\begin{tikzpicture}
  \begin{axis}
    \addplot[color=red]{<>};
  \end{axis}
\end{tikzpicture}
]],
      { i(1) }
    ),
    { condition = line_begin }
  ),

  -- Begin
  s(
    {
      trig = 'begin',
      descr = 'Begin enviroment',
      regTrig = true,
      wordTrig = false,
      snippetType = 'autosnippet',
    },
    fmta(
      [[
\begin{<>}
  <>
\end{<>}]],
      { i(1), i(2), rep(1) }
    ),
    { condition = line_begin }
  ),
  -- Own problem name

  s(
    {
      trig = 'el;',
      descr = 'Own problem',
      snippetType = 'autosnippet',
    },
    fmta(
      [[
\indent \textbf{\textit{<>}}
]],
      { i(1) }
    ),
    {
      condition = line_begin,
    }
  ),
  -- Own explanation
  s(
    {
      trig = 'ej;',
      descr = 'Own explanation',
      snippetType = 'autosnippet',
    },
    fmta(
      [[
\indent \indent \textit{<>}
]],
      { i(1) }
    ),
    {
      condition = line_begin,
    }
  ),
  -- Tabular
  -- TODO: add tablas

  -- Top level section
  s({
    trig = 'h1',
    descr = 'Top level section',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
  }, fmta([[\section{<>}]], { i(1) }), { condition = line_begin }),
  -- Mid level section
  s({
    trig = 'h2',
    descr = 'Mid level section',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
  }, fmta([[\subsection{<>}]], { i(1) }), { condition = line_begin }),
  -- Bottom level section
  s({
    trig = 'h3',
    descr = 'Bottom level section',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
  }, fmta([[\subsubsection{<>}]], { i(1) }), { condition = line_begin }),
}
