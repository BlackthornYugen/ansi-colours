#!/usr/bin/env bash
source lib/fizz_buzz.sh
source lib/colour.sh
source lib/csv_to_html.sh
source lib/check_certs.sh

tool=$1
shift

case $tool in
    print_colours)
        print_colours "$@"
    ;;
    fizz_buzz)
        fizz_buzz "$@"
    ;;
    csv_to_html)
        csv_to_html "$@"
    ;;
    check_certs)
        check_certs "$@"
    ;;
    *)
        echo "Usage: $0 print_colours [max_number] [colours_per_line]"
        echo "Usage: $0 fizz_buzz <number>"
        exit 1
    ;;
esac
