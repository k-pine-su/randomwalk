#!/usr/bin/bash

KUDASAI="$1"

if [ $# -ne 1 ]; then
    echo "<K> 第一引数にKUDASAIを指定してください"
    exit 1
fi

git add .
git commit -m "$KUDASAI"
git push