# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
# ==============================================================================
#
#   Tests of headers and sub-headers.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@testset "Headers and sub-headers" begin
    expected = """
<table>
  <tr class = "header">
    <th style = "text-align: right; ">1</th>
    <th style = "text-align: right; ">2</th>
    <th style = "text-align: right; ">3</th>
    <th style = "text-align: right; ">4</th>
  </tr>
  <tr class = "subheader">
    <th style = "text-align: right; ">A</th>
    <th style = "text-align: right; ">B</th>
    <th style = "text-align: right; ">C</th>
    <th style = "text-align: right; ">D</th>
  </tr>
  <tr class = "subheader headerLastRow">
    <th style = "text-align: right; ">E</th>
    <th style = "text-align: right; ">F</th>
    <th style = "text-align: right; ">G</th>
    <th style = "text-align: right; ">H</th>
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

    result = pretty_table(String, data, ["1" "2" "3" "4"; :A :B :C :D; :E :F :G :H];
                          backend = :html,
                          standalone = false)

    @test result == expected

    expected = """
<table>
  <tr class = "header headerLastRow">
    <th style = "text-align: right; ">1</th>
    <th style = "text-align: right; ">2</th>
    <th style = "text-align: right; ">3</th>
    <th style = "text-align: right; ">4</th>
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

    result = pretty_table(String, data, ["1" "2" "3" "4"; :A :B :C :D; :E :F :G :H];
                          backend = :html,
                          nosubheader = true,
                          standalone = false)

    @test result == expected

    expected = """
<table>
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

    result = pretty_table(String, data, ["1" "2" "3" "4"; :A :B :C :D; :E :F :G :H];
                          backend = :html,
                          noheader = true,
                          standalone = false)

    @test result == expected
end
