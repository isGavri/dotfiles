return {
	s(
		{ trig = "draw;", snippetType = "autosnippet" },
		fmta(
			[[
       \foreach \from/\to in {<>}
       \draw (\from) -- (\to);
       ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "node;", snippetType = "autosnippet" },
		fmta(
			[[
      \node (<>) at (<>, <>) {<>};
      <>
]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
				i(5),
			}
		)
	),
	s(
		{ trig = "tikz" },
		fmta(
			[[
      \begin{tikzpicture}
      [scale=1,auto=left,every node/.style={circle,fill=black!20}]
      \node (<>) at (<>, <>) {<>};
      <>
      \end{tikzpicture}
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
				i(5),
			}
		)
	),
	-- Snippet for report
	s(
		{ trig = "report;" },
		fmta(
			[[
      \documentclass[12pt]{report}
      \usepackage{pgfplots}
      \usepackage{tikz}
      \usepackage{amsmath}
      \usepackage{dsfont}
      \pgfplotsset{width=10cm, compat=1.9}
      \title{<>}
      \author{Estefan Gabriel Partida Toalá<>}
      \date{<>}
      \begin{document}
      \maketitle
      <>
      \end{document}
]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
			}
		)
	),
	-- Snippet for enviroment
	s(
		{ trig = "env;", snippetType = "autosnippet" },
		fmta(
			[[
      \begin{<>}
        <>
      \end{<>}
      ]],
			{
				i(1),
				i(2),
				rep(1),
			}
		)
	),
	s(
		{ trig = "hr", snippetType = "autosnippet" },
		fmta([[\href{<>}{<>}]], {
			i(1),
			i(2),
		})
	),
}
