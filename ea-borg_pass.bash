#!/bin/bash
# grabs the content of a file and prints it to the result var

borg_pass_file=/var/hidden/dir/borg.conf

if [ -e ${borg_pass_file} ];then
  borg_pass=$(cat ${borg_pass_file})
  echo "<result>${borg_pass}</result>"
else
  echo "<result>No borg_pass_file</result>"
fi
