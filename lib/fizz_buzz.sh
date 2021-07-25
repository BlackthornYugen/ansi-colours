#!/usr/bin/env bash
fizz_buzz() {
  if echo "$1" | grep -E "(3|5)" > /dev/null ; then
    if echo "$1" | grep "5" > /dev/null ; then
      printf "FIZZ"
    fi

    if echo "$1" | grep "3" > /dev/null ; then
      printf "BUZZ"
    fi
    printf "!\n"
  else
    printf "%s\n" "$1"
  fi
}