local auto = function(trig)
  return {trig=trig, snippetType = "autosnippet"}
end

return {
  s(auto("\\sd"),
    fmta(
        [[
          \documentclass{<>}

          \usepackage[<>]{babel}
          \usepackage[<>]{geometry}

          \title{<>}
          \author{<>}

          \begin{document}
            \maketitle

            <>
          \end{document}
        ]],
        { i(1, "article"), i(2, "portuguese"), i(3, "a4paper"), i(4), i(5), i(0)})),
  s(auto("upk"),
    fmta("\\usepackage{<>}", { i(1) })),

  s(auto("env"),
    fmta(
        [[
          \begin{<>}
            <>
          \end{<>}
        ]],
        { i(1), i(2), rep(1) })),
  s(auto("mm"),
    fmta("$<>$", { i(1) })),
  s(auto("--"),
    fmta("\\item <>", {i(1)})),

  s(auto("h1"),
    fmta("\\section{<>}", { i(1) })),
  s(auto("h2"),
    fmta("\\subsection{<>}", { i(1) })),

  s("tb",
    fmta("\\textbf{<>}", { i(1) })),
  s("ti",
    fmta("\\textit{<>}", { i(1) })),
  s("tt",
    fmta("\\texttt{<>}", { i(1) })),
  s("\"",
    fmta("``<>''", { i(1) })),
}
