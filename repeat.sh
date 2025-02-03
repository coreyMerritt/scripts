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
  REPEATS=$1
  DELAY=$2
  shift 2

  count=0
  while [ "$count" -lt "$REPEATS" ]; do
    count=$((count + 1))
    echo "$count: "
    eval "$@"
    sleep "$DELAY"
  done
}


checkForHelp $@
main $@

