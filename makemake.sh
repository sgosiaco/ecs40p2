#! /bin/bash
gpp="g++ -ansi -Wall -g"
args=""
exe=""
files=""
dep=""
if [ $# -ne 1 ]; then
  echo Executable name required.
  echo usage: makemake.sh executable_name
else
  exe=$1
  for f in *.cpp; do
    files=$files${f%.cpp}".o "
  done
  echo $exe : $files >> Makefile
  echo $'\t'$gpp -o $exe $files$'\n' >> Makefile
  for file in *.cpp; do
    dep=$(awk -F'"' '$0=$2' $file | awk 'BEGIN { ORS=" " }; /.h$/')
    echo ${file%.cpp}".o " : $file $dep >> Makefile
    echo $'\t'$gpp -c $file$'\n' >> Makefile
  done
  echo clean :$'\n'$'\t'rm -f $exe $files >> Makefile
fi
