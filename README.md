# randomwalk
協力者: m-kurihara-894 (https://github.com/m-kurihara-894/random_walk)



## 参考
- 理論的な側面
    - 資料1：https://www2.math.kyushu-u.ac.jp/~hara/lectures/02/pr-grad-all.pdf
- 数値結果
    - 資料2：https://mathworld.wolfram.com/PolyasRandomWalkConstants.html



## 概要
ランダムウォークに於いて，十分大きいステップ後に原点に戻ってくる確率を再帰確率という。
1次元，2次元ランダムウォークの再帰確率は1である，つまり十分大きいステップ後には必ず原点に戻ってくる，ことが知られている。
一方で，3次元以上のランダムウォークでは再帰確率は1でないことも知られている。

本プロジェクトの目的は，3次元ランダムウォークでこの再帰確率を求めることである。