#! /bin/bash
ARGS="-s "
dir=""
pattern=""
if [ $# -lt 2 ]; then
  echo usage: $0 directory pattern [-grep option]*
else
  if [ ! -d "$1" ]; then
    echo usage: $0 directory pattern [-grep option]*
  else
    if [ $# -eq 2 ]; then
      find $1 -exec grep $ARGS $2 {} \;
    else
      dir=$1
      pattern=$2
      shift
      shift
      while [ $# -gt 0 ]; do
        if [[ $1 = \-* ]]; then
          ARGS=$ARGS$1" "
        else
          echo usage: $0 directory pattern [-grep option]*
          exit
        fi
        shift
      done
      find $dir -exec grep $ARGS $pattern {} \;
    fi
  fi
fi
