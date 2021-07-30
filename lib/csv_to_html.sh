#!/usr/bin/bash
# Forked from https://unix.stackexchange.com/a/105531

csv_to_html() {
  echo '<style>
    tr:nth-child(even) {
        background: gray;
        color: white;
    }

    tr {
        background-color: lightgray;
    }
</style>
<table>'

  if [[ "$*" =~ "--no-headers" ]] ; then 
    print_header=false 
  else 
    print_header=true 
  fi

  while read -r INPUT ; do
  printf "<tr>"
    if $print_header; then
      printf "<th>%s</th>" "${INPUT//,/</th><th>}"
      print_header=false
    else
      printf "<td>%s</td>" "${INPUT//,/</td><td>}"
    fi
  echo "</tr>"
  done < /dev/stdin
  echo "</table>"
}