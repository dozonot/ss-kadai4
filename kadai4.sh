#!/bin/sh

TMP=/tmp/$$
echo "入力値は素数です。"           > ${TMP}-true
echo "入力値は素数ではありません。" > ${TMP}-false

ERROR_EXIT () {
  echo "$1" >&2
  rm -f ${TMP}-*
  exit 1
}

echo "テスト開始"
echo "test1: 素数判定"
sh kadai3.sh 3 > ${TMP}-ans || ERROR_EXIT "error in test1-1"
diff ${TMP}-ans ${TMP}-true || ERROR_EXIT "error in test1-2"
echo "test1: 成功"

echo "test2: 非素数判定"
sh kadai3.sh 4 > ${TMP}-ans || ERROR_EXIT "error in test2-1"
diff ${TMP}-ans ${TMP}-false || ERROR_EXIT "error in test2-2"
echo "test2: 成功"

echo "test3: 大きな素数判定"
sh kadai3.sh 8191 > ${TMP}-ans || ERROR_EXIT "error in test3-1"
diff ${TMP}-ans ${TMP}-true || ERROR_EXIT "error in test3-2"
echo "test3: 成功"

echo "test4: 大きな非素数判定"
sh kadai3.sh 8192 > ${TMP}-ans || ERROR_EXIT "error in test4-1"
diff ${TMP}-ans ${TMP}-false || ERROR_EXIT "error in test4-2"
echo "test4: 成功"

echo "一時ファイルの削除"
rm -f ${TMP}-*
exit 0
