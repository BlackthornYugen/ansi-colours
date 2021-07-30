Describe 'csv to html'
  Include lib/csv_to_html.sh

  It "has style"
    Data
      #|a,b,c
    End
    
    When call csv_to_html
    The status should be success
    The output should match pattern '<style>*</style>*'
  End

  It "can format a single-line of data"
    Data
      #|a,b,c
    End
    
    When call csv_to_html
    The status should be success
    The output should match pattern '*<table>*<th>a</th><th>b</th><th>c</th>*</table>*'
  End

  It "can format a single-line of data without headers"
    Data
      #|x,y,z
    End

    When call csv_to_html --no-headers
    The status should be success
    The output should match pattern '*<table>*<td>x</td><td>y</td><td>z</td>*</table>*'
  End

  It "can format multiple lines of data"
    Data
      #|a,b,c
      #|x,y,z
    End

    When call csv_to_html
    The status should be success
    The output should match pattern '*<table>*<th>a</th><th>b</th><th>c</th>*<td>x</td><td>y</td><td>z</td>*</table>*'
  End

  It "can format multiple lines of data without headers"
    Data
      #|a,b,c
      #|x,y,z
    End

    When call csv_to_html --no-headers
    The status should be success
    The output should match pattern '*<table>*<td>a</td><td>b</td><td>c</td>*<td>x</td><td>y</td><td>z</td>*</table>*'
  End
End