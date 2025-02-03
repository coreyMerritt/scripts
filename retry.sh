#!/bin/bash

checkForHelp() {
  if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
    showHelp
    exit 1
  fi
}



showHelp() {
  echo "Usage: $0 <repeats> <delay> <command>"
  echo "Ex: $0 3600 1 date"
}



main() {
  retries=$1
  delay=$2
  shift 2

  count=0
  until eval "$@"; do
    count=$((count + 1))
    if [ "$count" -ge "$retries" ]; then
      echo "Command failed after $retries attempts."
      exit 1
    fi
    sleep "$delay"
  done
}

checkForHelp $@
main $@
