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
        set -e
        export DAYS_BEFORE_EMAIL=${DAYS_BEFORE_EMAIL:-21}
        export SENDMAIL_BIN="/usr/sbin/sendmail.postfix"
        export TO_ADDR="${MAIL_ADDR}"

        pushd ~/mail

        while read CERT_FILE
        do
        SERVER_NAME=`basename $CERT_FILE`
        SERVER_NAME="${SERVER_NAME:0:-4}"
        printf "Checking to see if %s will expire in the next %s days... " "${SERVER_NAME}" "$DAYS_BEFORE_EMAIL"
        openssl s_client -servername ${SERVER_NAME} -connect ${SERVER_NAME}:443 < /dev/null 2> /dev/null \
            | tee ${SERVER_NAME}.current.pem \
            | openssl x509 -noout -checkend $((60 * 60 * 24 * ${DAYS_BEFORE_EMAIL})) || \
                email $CERT_FILE ${SERVER_NAME}.current.pem \
                | tee last-mail-${SERVER_NAME}.txt \
                | $SENDMAIL_BIN -t
        sleep 0.3
        done < certs_to_check.txt

        popd
    ;;
    *)
        echo "Usage: $0 print_colours [max_number] [colours_per_line]"
        echo "Usage: $0 fizz_buzz <number>"
        exit 1
    ;;
esac
