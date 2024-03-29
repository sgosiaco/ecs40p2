#! /bin/bash
ARGS="-srh "
dir=""
pattern=""
if [ $# -lt 2 ]; then
  echo usage: grepdir.sh directory pattern [-grep option]*
else
  if [ ! -d "$1" ]; then
    echo usage: grepdir.sh directory pattern [-grep option]*
  else
    if [ $# -eq 2 ]; then
      grep $ARGS $2 $1
    else
      dir=$1
      pattern=$2
      shift
      shift
      while [ $# -gt 0 ]; do
        if [[ $1 = \-* ]]; then
          ARGS=$ARGS$1" "
        else
          echo usage: grepdir.sh directory pattern [-grep option]*
          exit
        fi
        shift
      done
      grep $ARGS $pattern $dir
    fi
  fi
fi
