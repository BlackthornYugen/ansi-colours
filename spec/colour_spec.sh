Describe 'ansi colours'
  Include lib/colour.sh

  It 'should end with a colour reset'
    When call print_colours_escaped
    The output should end with "\u001b[0m"
  End

  It 'should be single spaced'
    When call print_colours_escaped
    The output should not include '

'
    The output should match pattern '*15
???????38;5;16m*'
  End

  Describe 'should reach'
    Parameters
      1
      2
      100
      254
      255
    End

    It "$1"
      When call print_colours_escaped
      The output should match pattern "*\u001b?38;5;$1*$1*"
    End
  End

  Describe 'when called with'
    Parameters
      255 16
      30  3
      254 32
    End

    It "$1 $2, should wrap correctly"
      When call print_colours_escaped $1 $2

      The line 1 of output should start with "\u001b[38;5;0"
      The line 1 of output should end with "$(( $2 - 1 ))"
      The line 2 of output should start with "\u001b[38;5;$(( $2 * 2 - $2 ))"
      The line 2 of output should end with "$(( $2 * 2 - 1 ))"
    End

    It "$1 $2, the output should end with $1"
      When call print_colours_escaped $1 $2

      The output should include "\u001b[38;5;$1"
      The output should not include "\u001b[38;5;$(( $1 + 1 ))"
    End

  End

  It 'contain colour data along with numbers'
    When call print_colours_escaped
    The output should include '\u001b[38;5;32m  32\u001b[38;5;33m  33\u001b[38;5;34m  34\u001b[38;5;35m  35\u001b[38;5;36m  36\u001b[38;5;37m  37\u001b[38;5;38m  38\u001b[38;5;39m  39\u001b[38;5;40m  40\u001b[38;5;41m  41\u001b[38;5;42m  42\u001b[38;5;43m  43\u001b[38;5;44m  44\u001b[38;5;45m  45\u001b[38;5;46m  46\u001b[38;5;47m  47'
    The output should match pattern '*80*81*82*83*84*85*86*87*88*89*90*91*92*93*94*95*'
    The output should include '\u001b[38;5;240m 240\u001b[38;5;241m 241\u001b[38;5;242m 242\u001b[38;5;243m 243\u001b[38;5;244m 244\u001b[38;5;245m 245\u001b[38;5;246m 246\u001b[38;5;247m 247\u001b[38;5;248m 248\u001b[38;5;249m 249\u001b[38;5;250m 250\u001b[38;5;251m 251\u001b[38;5;252m 252\u001b[38;5;253m 253\u001b[38;5;254m 254\u001b[38;5;255m 255'
  End
End