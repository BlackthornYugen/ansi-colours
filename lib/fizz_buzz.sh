#!/usr/bin/env bash
fizz_buzz() {
  message=""
  if [ $(( $1 % 3 )) -eq 0 ]; then
    message="${message}FIZZ"
  fi

  if [ $(( $1 % 5 )) -eq 0 ]; then
    message="${message}BUZZ"
  fi

  if [ -z "$message" ]; then
    printf "%s\n" "$1"
  else
    printf "%s!\n" "$message"
  fi
}