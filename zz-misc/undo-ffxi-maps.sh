#!/bin/bash


notated_map_dats=$(find /mnt/m/personal/games/ffxi/notated-map-dats/ -type f -name "*.DAT")
backup_files=""
for dat in $notated_map_dats; do
  backup_file=$(echo "$dat" | sed 's/notated-map-dats/backup-dats/g')
  backup_files="$backup_files $backup_file"
done

for backup_file in $backup_files; do
  dest=$(echo "$backup_file" | sed 's/backup-dats/backup-map-dats/g')
  dir=$(dirname $dest)
  mkdir -p $dir
  cp -r $backup_file $dest
done
