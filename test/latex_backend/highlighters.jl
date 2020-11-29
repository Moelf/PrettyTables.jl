# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
# ==============================================================================
#
#   Tests of highlighters.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@testset "Highlighters" begin
    expected = """
\\begin{table}
  \\begin{tabular}{rrrr}
    \\hline\\hline
    \\textbf{Col. 1} & \\textbf{Col. 2} & \\textbf{Col. 3} & \\textbf{Col. 4} \\\\\\hline
    1 & false & 1.0 & 1 \\\\
    2 & true & 2.0 & 2 \\\\
    \\color{red}{3} & false & \\color{red}{3.0} & \\color{red}{3} \\\\
    4 & true & 4.0 & 4 \\\\
    5 & false & 5.0 & 5 \\\\
    6 & true & 6.0 & 6 \\\\\\hline\\hline
  \\end{tabular}
\\end{table}
"""

    hl = LatexHighlighter((data, i, j)->data[i,j] == 3, "color{red}")
    result = pretty_table(String, data, backend = :latex, highlighters = hl)

    @test result == expected

    expected = """
\\begin{table}
  \\begin{tabular}{rrrr}
    \\hline\\hline
    \\textbf{Col. 1} & \\textbf{Col. 2} & \\textbf{Col. 3} & \\textbf{Col. 4} \\\\\\hline
    1 & false & 1.0 & 1 \\\\
    2 & true & 2.0 & 2 \\\\
    \\textbf{\\color{red}{3}} & false & \\textbf{\\color{red}{3.0}} & \\textbf{\\color{red}{3}} \\\\
    4 & true & 4.0 & 4 \\\\
    5 & false & 5.0 & 5 \\\\
    6 & true & 6.0 & 6 \\\\\\hline\\hline
  \\end{tabular}
\\end{table}
"""

    hl = LatexHighlighter((data, i, j)->data[i,j] == 3, ["textbf", "color{red}"])
    result = pretty_table(String, data, backend = :latex, highlighters = hl)

    @test result == expected
end
