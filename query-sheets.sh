#!/bin/bash

# sheet_id row# col#
if [[ ! -n "$1" ]]; then
  echo "arg1 is the sheet ID"
fi


SHEET_ID="$(yq -r ".${1}.id" /mnt/m/personal/scripts/configs/sheets.yml)"
COL=$2
ROW=$3
SHEET_URL="https://docs.google.com/spreadsheets/d/e/$SHEET_ID/pub"
CSV_URL="$SHEET_URL?output=csv"
CSV_DIR="/mnt/m/personal/zz-temp"
CSV_PATH="$CSV_DIR/$SHEET_ID.csv"

if [[ "$@" =~ "--pull" ]]; then
  curl -s -L "$CSV_URL" -o "$CSV_PATH"
fi
data="$(awk -F',' -v col="$COL" -v row="$ROW" 'NR==(row + 0) {print $col}' "$CSV_PATH")"

echo $data

