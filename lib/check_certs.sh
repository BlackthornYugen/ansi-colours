#!/usr/bin/env bash
#https://gist.github.com/BlackthornYugen/62fa358f79d9e7248e997ccbeaf11472
set -e

export DAYS_BEFORE_EMAIL=${DAYS_BEFORE_EMAIL:-21}
export SENDMAIL_BIN="/usr/sbin/sendmail.postfix"
export TO_ADDR="${MAIL_ADDR}"

# usage $0 {NEW_CERT} {OLD_CERT}
function email() {
    CERT_NAME=$(basename "$1")
    CERT_EXPIRE_DATE="$(openssl x509 -in "$2" -enddate -noout | sed 's/notAfter=//' | date --file=-)"
    CERT_DAYS_UNTIL_EXPIRE=$(( ($(date --date="${CERT_EXPIRE_DATE}" +%s) - $(date +%s) ) / 60 / 60 / 24 ))
    CERT_DETAILS=$(openssl x509 -text -noout -in "$1")
    CERT_PEM=$(openssl x509 -in "$1")

    printf "To: %s \nBcc: %s \nSubject: %s expires in %s days. \nContent-Type: text/html \n" \
        "$TO_ADDR" \
        "$BCC_ADDR" \
        "$CERT_NAME" \
        "$CERT_DAYS_UNTIL_EXPIRE"
    printf "<h1>%s</h1>\n\n" "$CERT_NAME"
    printf "<p>Enable ssh on %s, then run the following: </p>\n\n" "${CERT_NAME:0:-4}"
    printf "<pre>%s\n%s\n%s\n%s\n%s\n%s</pre>\n" \
       "ssh ${CERT_NAME:0:-4}" \
           "tee /etc/vmware/ssl/rui.crt <<_EOL" \
           "${CERT_PEM}" \
       "_EOL" \
       "/etc/init.d/hostd restart" \
       "/etc/init.d/vpxa restart"
    printf "%s will expire on %s. See below for the latest certifiate for this domain issued on server: \n\n<pre>\n%s\n</pre>" \
        "$CERT_NAME" \
        "$CERT_EXPIRE_DATE" \
        "$CERT_DETAILS"
    printf "<h1>Certificate Status</h1><p>The following is the status of all renewals on %s for %s.</p>\n<pre>%s</pre>" \
        "$(hostname --fqdn)" \
        "$USER" \
        "$(~/.acme.sh/acme.sh list)"
}

function check_certs() {
    while read -r CERT_FILE
    do
    SERVER_NAME=$(basename "$CERT_FILE")
    SERVER_NAME="${SERVER_NAME:0:-4}"
    printf "Checking to see if %s will expire in the next %s days... " "${SERVER_NAME}" "$DAYS_BEFORE_EMAIL"
    openssl s_client -servername "${SERVER_NAME}" -connect "${SERVER_NAME}:443" < /dev/null 2> /dev/null \
        | tee "${SERVER_NAME}.current.pem" \
        | openssl x509 -noout -checkend $((60 * 60 * 24 * "${DAYS_BEFORE_EMAIL}")) || \
            email "$CERT_FILE" "${SERVER_NAME}.current.pem" \
            | tee "last-mail-${SERVER_NAME}.txt" \
            | $SENDMAIL_BIN -t
    sleep 0.3
    done < certs_to_check.txt
}
