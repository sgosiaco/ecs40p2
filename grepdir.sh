#! /bin/bash
ARGS="-s "
if [ $# -lt 2 ]; then
  echo usage: $0 directory pattern [-grep option]*
else
  if [ ! -d "$1" ]; then
    echo usage: $0 directory pattern [-grep option]*
  else
    if [ $# -eq 2 ]; then
      find $1 -exec grep $ARGS $2 {} \;
    else
      shift
      shift
      while [ $# -gt 0 ]; do
        if [[ $1 = \-* ]]; then
          ARGS+=$1
        fi
        shift
      done
      find $1 -exec grep $ARGS $2 {} \;
    fi
  fi
fi
