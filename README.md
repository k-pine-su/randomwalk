# randomwalk
協力者: m-kurihara-894 (https://github.com/m-kurihara-894/random_walk)



## 参考
- 理論的な側面
    - 資料1：https://www2.math.kyushu-u.ac.jp/~hara/lectures/02/pr-grad-all.pdf
- 数値結果
    - 資料2：https://mathworld.wolfram.com/PolyasRandomWalkConstants.html



## 概要
$`n`$次元ランダムウォークに於いて，十分大きいステップ後に原点に戻ってくる確率$`p(n)`$を再帰確率という。
$`n`$次元ランダムウォークが単純であるとは，$`2n`$個の隣接点に進む確率がすべて等確率であることをいう。

$`n=1,\,2`$の単純ランダムウォークで$`p(n)=1`$である，つまり十分大きいステップ後には必ず原点に戻ってくる，ことが知られている。
一方で，$`n=3`$以上の単純ランダムウォークで$`p(n)`$は$`1`$でないことも知られている。
    
本プロジェクトの目的は，実際に$`3`$次元単純ランダムウォークをシミュレートすることにより，$`p(3)`$の具体的な値を求めることである。

また，理論的に$`p(3)`$を求めると解析的に実行不可能な積分が現れるのだが，この積分を評価することにより求められる$`p(3)`$と，シミュレーションにより得られた$`p(3)`$の値とを比較することも行う。数値積分による$`p(3)`$の評価は，協力者であるm-kurihara-894が行う。



## $`p(3)`$の評価
coming soon...