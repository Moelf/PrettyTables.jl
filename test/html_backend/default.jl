# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
# ==============================================================================
#
#   Tests of default printing.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@testset "Default" begin

    expected = """
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style>
  table, td, th {
      border-collapse: collapse;
      font-family: sans-serif;
  }

  td, th {
      border-bottom: 0;
      padding: 4px
  }

  tr:nth-child(odd) {
      background: #eee;
  }

  tr:nth-child(even) {
      background: #fff;
  }

  tr.header {
      background: navy !important;
      color: white;
      font-weight: bold;
  }

  tr.subheader {
      background: lightgray !important;
      color: black;
  }

  tr.headerLastRow {
      border-bottom: 2px solid black;
  }

  th.rowNumber, td.rowNumber {
      text-align: right;
  }

</style>
<body>
<table>
  <tr class = "header headerLastRow">
    <th style = "text-align: right; ">Col. 1</th>
    <th style = "text-align: right; ">Col. 2</th>
    <th style = "text-align: right; ">Col. 3</th>
    <th style = "text-align: right; ">Col. 4</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">1</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">1.0</td>
    <td style = "text-align: right; ">1</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">2</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">2.0</td>
    <td style = "text-align: right; ">2</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">3</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">3.0</td>
    <td style = "text-align: right; ">3</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">4</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">4.0</td>
    <td style = "text-align: right; ">4</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">5</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">5.0</td>
    <td style = "text-align: right; ">5</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">6</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">6.0</td>
    <td style = "text-align: right; ">6</td>
  </tr>
</table>
</body>
</html>
"""
    result = pretty_table(String, data, backend = :html)
    @test result == expected

    expected = """
<table>
  <tr class = "header headerLastRow">
    <th style = "text-align: right; ">Col. 1</th>
    <th style = "text-align: right; ">Col. 2</th>
    <th style = "text-align: right; ">Col. 3</th>
    <th style = "text-align: right; ">Col. 4</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">1</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">1.0</td>
    <td style = "text-align: right; ">1</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">2</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">2.0</td>
    <td style = "text-align: right; ">2</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">3</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">3.0</td>
    <td style = "text-align: right; ">3</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">4</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">4.0</td>
    <td style = "text-align: right; ">4</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">5</td>
    <td style = "text-align: right; ">false</td>
    <td style = "text-align: right; ">5.0</td>
    <td style = "text-align: right; ">5</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">6</td>
    <td style = "text-align: right; ">true</td>
    <td style = "text-align: right; ">6.0</td>
    <td style = "text-align: right; ">6</td>
  </tr>
</table>
"""

    result = pretty_table(String, data, backend = :html, standalone = false)
    @test result == expected
end

@testset "Dictionaries" begin
    dict = Dict{Int64,String}(1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr",
                              5 => "May", 6 => "Jun")

    expected = """
<table>
  <tr class = "header">
    <th style = "text-align: right; ">Keys</th>
    <th style = "text-align: right; ">Values</th>
  </tr>
  <tr class = "subheader headerLastRow">
    <th style = "text-align: right; ">Int64</th>
    <th style = "text-align: right; ">String</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">1</td>
    <td style = "text-align: right; ">Jan</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">2</td>
    <td style = "text-align: right; ">Feb</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">3</td>
    <td style = "text-align: right; ">Mar</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">4</td>
    <td style = "text-align: right; ">Apr</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">5</td>
    <td style = "text-align: right; ">May</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">6</td>
    <td style = "text-align: right; ">Jun</td>
  </tr>
</table>
"""

    result = pretty_table(String, dict;
                          backend = :html,
                          sortkeys = true,
                          standalone = false)

    @test result == expected
end

@testset "Vectors" begin

    vec = 0:1:5

    expected = """
<table>
  <tr class = "header headerLastRow">
    <th style = "text-align: right; ">Col. 1</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">0</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">1</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">2</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">3</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">4</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">5</td>
  </tr>
</table>
"""

    result = pretty_table(String, vec, backend = :html, standalone = false)
    @test result == expected

    expected = """
<table>
  <tr class = "header headerLastRow">
    <th class = "rowNumber">Row</th>
    <th style = "text-align: center; ">Col. 1</th>
  </tr>
  <tr>
    <td class = "rowNumber">1</td>
    <td style = "text-align: center; ">0</td>
  </tr>
  <tr>
    <td class = "rowNumber">2</td>
    <td style = "text-align: center; ">1</td>
  </tr>
  <tr>
    <td class = "rowNumber">3</td>
    <td style = "text-align: center; ">2</td>
  </tr>
  <tr>
    <td class = "rowNumber">4</td>
    <td style = "text-align: center; ">3</td>
  </tr>
  <tr>
    <td class = "rowNumber">5</td>
    <td style = "text-align: center; ">4</td>
  </tr>
  <tr>
    <td class = "rowNumber">6</td>
    <td style = "text-align: center; ">5</td>
  </tr>
</table>
"""

    result = pretty_table(String, vec;
                          alignment = :c,
                          backend = :html,
                          show_row_number = true,
                          standalone = false)

    @test result == expected

    expected = """
<table>
  <tr class = "header">
    <th style = "text-align: right; ">A</th>
  </tr>
  <tr class = "subheader">
    <th style = "text-align: right; ">B</th>
  </tr>
  <tr class = "subheader">
    <th style = "text-align: right; ">C</th>
  </tr>
  <tr class = "subheader headerLastRow">
    <th style = "text-align: right; ">D</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">0</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">1</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">2</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">3</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">4</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">5</td>
  </tr>
</table>
"""

    result = pretty_table(String, vec, ["A", "B", "C", "D"];
                          backend = :html,
                          standalone = false)

    @test result == expected
end

@testset "Print missing, nothing, and #undef" begin

    matrix = Matrix{Any}(undef,3,3)
    matrix[1,1:2] .= missing
    matrix[2,1:2] .= nothing
    matrix[3,1]   = missing
    matrix[3,2]   = nothing

    expected = """
<table>
  <tr class = "header headerLastRow">
    <th style = "text-align: right; ">Col. 1</th>
    <th style = "text-align: right; ">Col. 2</th>
    <th style = "text-align: right; ">Col. 3</th>
  </tr>
  <tr>
    <td style = "text-align: right; ">missing</td>
    <td style = "text-align: right; ">missing</td>
    <td style = "text-align: right; ">#undef</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">nothing</td>
    <td style = "text-align: right; ">nothing</td>
    <td style = "text-align: right; ">#undef</td>
  </tr>
  <tr>
    <td style = "text-align: right; ">missing</td>
    <td style = "text-align: right; ">nothing</td>
    <td style = "text-align: right; ">#undef</td>
  </tr>
</table>
"""

    result = pretty_table(String, matrix;
                          tf = tf_html_default,
                          standalone = false)

    @test result == expected
end
