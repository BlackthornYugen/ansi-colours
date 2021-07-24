# ANSI Colours
It prints out the ansi colours as described in [Haoyi's blog post](https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html) for Python but adapted to sh. Just wanted to make something to play with shellspec.

## Run

```shell
./run.sh
```

## Tests
Asuming you have shellspec on your path, test by running "shellspec" from the root.

```shell
ANSI Colour tests
Running: /bin/sh [sh]

ansi colours
  should end with a colour reset
  should be single spaced
  should reach
    1
    2
    100
    254
    255
  contain colour data along with numbers

Finished in 0.22 seconds (user 0.16 seconds, sys 0.07 seconds)
8 examples, 0 failures
```
