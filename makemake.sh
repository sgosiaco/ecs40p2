#! /bin/bash
gpp="g++ -ansi -Wall -g"
args=""
exe=""
files=""
if [ $# -ne 1 ]; then
  echo usage: makemake.sh executable_name
else
  exe=$1
  for f in *.cpp; do
    files=$files${file%.cpp}".o "
  done
  echo $exe : $files >> Makefile
  echo '\t'$gpp -o $exe $files
fi
