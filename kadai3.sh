#!/bin/bash

## main
### Input value
INPUT=${1}

### Check prime
if [ ${INPUT} -lt 2 ] ; then
  echo "入力値は素数ではありません。"
  exit 0
elif [ ${INPUT} -eq 2 ] ; then
  echo "入力値は素数です。"
  exit 0
else
  I=2
  while [ ${I} -lt ${INPUT} ] ; do
    CHECKNUM=$((${INPUT} % ${I}))
    if [ ${CHECKNUM} -eq 0 ] ; then
      echo "入力値は素数ではありません。"
      exit 0
    fi
    I=$(( I + 1 ))
  done
  echo "入力値は素数です。"
  exit 0
fi
