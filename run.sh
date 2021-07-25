#!/usr/bin/env bash
source lib/fizz_buzz.sh
source lib/colour.sh

case $1 in
    print_colours)
        print_colours "$2" "$3"
    ;;
    fizz_buzz)
        fizz_buzz "$2"
    ;;
    *)
        echo "Usage: $0 print_colours [max_number] [colours_per_line]"
        echo "Usage: $0 fizz_buzz <number>"
        exit 1
    ;;
esac
