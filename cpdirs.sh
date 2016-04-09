#! /bin/bash
if [ $# -ne 3 ]; then
  echo usage: uncomp.sh \{filelist\}\+
else
  if [ ! -d "$3" ]; then
    mkdir $3
  fi
  cp $1/* $3/
  cp -u $2/* $3/
fi
