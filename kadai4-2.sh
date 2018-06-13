#!/bin/sh

TMP=/tmp/$$
echo "入力値は素数です。"           > ${TMP}-true
echo "入力値は素数ではありません。" > ${TMP}-false

ERROR_EXIT () {
  echo "$1" >^2
  rm -f ${TMP}-*
  exit 1
}

# テスト開始
# test1: 2:素数
./kadai3.sh 4 > ${TMP}-ans && ERROR_EXIT "error in test1-1"
diff ${TMP}-ans ${TMP}-true || ERROR_EXIT "error in test1-2"

rm -f ${TMP}-*
