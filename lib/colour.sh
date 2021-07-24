hello() {
  echo "Hello ${1}!"
}

colour() {
  #https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
  for i in $(seq 0 15)
  do
    for j in $(seq 0 15)
    do
        code=$((i * 16 + j))
        printf "\u001b[38;5;${code}m%4s" "$code"
    done
    printf "\n"
  done

  printf "\u001b[0m"
}
