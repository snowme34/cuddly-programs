setup() {
  touch data_racing_bash_output
  echo -n '' > data_racing_bash_output
}

write() {
  i="0"
  while [ $i -lt 100 ]; do
    echo -e $1
    i=$[$i+1]
  done
}

run() {
  write "HelloHelloHello\nWorld" >> data_racing_bash_output & write "ByeByeBye\nLove" >> data_racing_bash_output
}

setup
run
echo "Done"
echo "Output in ./data_racing_bash_output"
