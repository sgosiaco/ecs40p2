#! /bin/bash
if [ $# -eq 0 ]; then
  echo usage: uncomp.sh \{filelist\}\+
fi
while [ $# -gt 0 ] ; do
 case $1 in
 *.tar) tar -xf $1 ;;
 *.tgz) tar -xzf $1 ;;
 *.tar.gz) tar -xzf $1 ;;
 *.gz) gunzip $1 ;;
 *.zip) unzip -qq $1 ;;
 *) echo $0: $1 has no compression extension. ;;
 esac
 shift
done # while
