Describe 'fizzbuzz'
  Include lib/fizz_buzz.sh

  Parameters
    1   "1"
    2   "2"
    3   "FIZZ!"
    4   "4"
    5   "BUZZ!"
    6   "FIZZ!"
    13  "13"
    15  "FIZZBUZZ!"
    35  "BUZZ!"
    53  "53"
    350 "BUZZ!"
    305 "BUZZ!"
    503 "503"
    504 "FIZZ!"
    505 "BUZZ!"
    606 "FIZZ!"
  End

  It "should say $2 for $1"
    When call fizz_buzz $1
    The output should eq $2
  End
End