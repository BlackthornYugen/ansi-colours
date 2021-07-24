#!/usr/bin/env bash

print_colours() {
  #https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
  max_colour=${1:-255}
  colours_per_line=${2:-16}

  for i in $(seq 0 $(( max_colour / colours_per_line )) )
  do
    for j in $(seq 1 $(( colours_per_line )))
    do
        code=$(( i * colours_per_line + j - 1 ))
        if [ $code -lt $(( max_colour + 1 )) ]; then
          printf "\u001b[38;5;${code}m%4s" "$code"
        fi
    done
    printf "\n"
  done

  printf "\u001b[0m"
}
