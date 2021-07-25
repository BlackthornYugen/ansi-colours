Describe 'fizzbuzz'
  Include lib/fizz_buzz.sh

  Parameters
    1   "1"
    2   "2"
    3   "BUZZ!"
    4   "4"
    5   "FIZZ!"
    6   "6"
    13  "BUZZ!"
    15  "FIZZ!"
    35  "FIZZBUZZ!"
    53  "FIZZBUZZ!"
    350 "FIZZBUZZ!"
    305 "FIZZBUZZ!"
    503 "FIZZBUZZ!"
    504 "FIZZ!"
    505 "FIZZ!"
    606 "606"
  End

  It "should say $2 for $1"
    When call fizz_buzz $1
    The output should eq $2
  End
End