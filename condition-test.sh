#!/bin/bash

# this will test exit codes to the JSS

result=""

#if [[ -e "/Users" ]]; then
#  result="True"
#  echo $result
#  exit 0
#fi

if [[ -e "/Users" ]]; then
  result="False"
  echo $result
  exit 1
fi

# fin.
# after you ./ this, run `echo $?` to see the result of it.
# for the first test, the result should be `0`
# for the second test, the result should be `1`
