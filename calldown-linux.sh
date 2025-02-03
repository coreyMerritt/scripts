#!/bin/bash



checkForHelp() {
  if [[ -z "$1" ]]; then
    showHelp
    exit 1
  elif [[ -n "$2" ]]; then
    showHelp
    exit 1
  fi
}



showHelp() {
  echo "Usage: $0 <local_directory>"
  echo "Ex: $0 ."
}



installWgetIfNeeded() {
  which wget
  if [[ ! $? -eq 0 ]]; then
    pkm="command -v apt || command -v dnf || command -v yum || command -v pacman || command -v zypper || command -v apk || command -v brew"
    $pkm install -y wget
  fi
}



cleanupIndexFiles() {
  index_files="$(find . -name "index.html" | grep -v .git)"
  for file in $index_files; do
    rm -rf $file
  done
}



main() {
  dir="$1/00-manual"
  mkdir -p "$dir"
  cd "$dir"

  installWgetIfNeeded
  
  wget -r -np -nH --cut-dirs=0 --reject "index.html*" --no-parent http://clmerritt.com/
  
  cleanupIndexFiles
}



checkForHelp $@
main $@

