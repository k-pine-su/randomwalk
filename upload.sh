#!/usr/bin/bash

KUDASAI="$1"

if [ $# -ne 1 ]; then
    echo "<K> 第一引数にKUDASAIを指定してください"
    exit 1
fi

git add .
# # git add だとなんでもアップロードする(Manifestは除きたい)ので，次のようにする
# # git ignoreの方法を学びたい
# git add Project.toml src/*.jl test/*.jl README.md upload.sh
git commit -m "$KUDASAI"
git push