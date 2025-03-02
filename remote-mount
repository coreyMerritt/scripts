#!/usr/bin/bash

checkForHelp() {
  if [[ -z "$1" ]]; then
    showHelp
    exit 1
  elif [[ -z "$2" ]]; then
    showHelp
    exit 1
  elif [[ -z "$3" ]]; then
    showHelp
    exit 1
  elif [[ -z "$4" ]]; then
    showHelp
    exit 1
  elif [[ "$1" == "-h" ]]; then
    showHelp
    exit 1
  elif [[ "$1" == "--help" ]]; then
    showHelp
    exit 1
  fi
}



showHelp() {
  echo "Usage: $0 <ip/path> <local_path> <rem_user> <rem_pass>"
  echo -e "\t ex: $0 192.168.0.2/c /mnt/remote_c_drive someUser somePass"
}



main() {
  rem_mount="$1"
  local_mount="$2"
  rem_user="$3"
  rem_pass="$4"
  sudo mount \
  -t cifs //$rem_mount/ $local_mount \
  -o username=$rem_user,password=$rem_pass,vers=3.0
}

checkForHelp $@
main $@
