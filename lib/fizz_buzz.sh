#!/usr/bin/env bash
fizz_buzz() {
  message=""
  case $1 in
    *5*) message="${message}FIZZ"
  esac

  case "$1" in
    *3*) message="${message}BUZZ"
  esac

  if [ -z "$message" ]; then
    printf "%s\n" "$1"
  else
    printf "%s!\n" "$message"
  fi
}