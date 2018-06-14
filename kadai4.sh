#!/bin/sh

TMP=/tmp/$$
echo "入力値は素数です。"           > ${TMP}-true
echo "入力値は素数ではありません。" > ${TMP}-false

ERROR_EXIT () {
  echo "$1" >&2
  rm -f ${TMP}-*
  exit 1
}

# テスト開始
## test1: 素数
sh kadai3.sh 3 > ${TMP}-ans || ERROR_EXIT "error in test1-1"
diff ${TMP}-ans ${TMP}-true || ERROR_EXIT "error in test1-2"

## test2: 非素数
sh kadai3.sh 4 > ${TMP}-ans || ERROR_EXIT "error in test2-1"
diff ${TMP}-ans ${TMP}-false || ERROR_EXIT "error in test2-2"

rm -f ${TMP}-*
exit 0
