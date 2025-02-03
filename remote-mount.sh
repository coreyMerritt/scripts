#!/usr/bin/bash

checkForHelp() {
  if [[ -z "$1" ]]; then
    help()
  elif [[ -z "$2" ]]; then
    help()
  elif [[ -z "$3" ]]; then
    help()
  elif [[ -z "$4" ]]; then
    help()
  elif [[ "$1" == "-h" ]]; then
    help()
  elif [[ "$1" == "--help" ]]; then
    help()
  fi
}



help() {
  echo "Usage: $0 <ip/path> <local_path>"
  echo -e "\t ex: $0 192.168.0.2/c /mnt/remote_c_drive"
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

checkForHelp
main
