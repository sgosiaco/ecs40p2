#! /bin/bash
if [ $# -ne 3 ]; then
  echo usage: $0 source_directory1 source_directory2 dest_directory
else
  if [ ! -d "$3" ]; then
    if [ ! -f "$3" ]; then
      mkdir $3
    else
     echo usage: $0 source_directory1 source_directory2 dest_directory
     exit
    fi
  fi
  cp -u $1/* $3/
  cp -u $2/* $3/
fi
