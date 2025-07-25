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
    
本プロジェクトの目的は実際に$`3`$次元単純ランダムウォークをシミュレートすることにより，$`p(3)`$の具体的な値を求めることである。

また，理論的に$`p(3)`$を求めると解析的に実行不可能な積分が現れるのだが，この積分を評価することにより求められる$`p(3)`$と，本シミュレーションにより得られた$`p(3)`$の値とを比較することも行う。数値積分による$`p(3)`$の評価は，協力者であるm-kurihara-894が行う。



## 数値的な$`p(3)`$の評価
詳細な議論は[協力者のREADME](https://github.com/k-pine-su/randomwalk)及び[資料1](https://www2.math.kyushu-u.ac.jp/~hara/lectures/02/pr-grad-all.pdf)を参照してほしいが，Fourier変換を用いることにより$`p(3)`$は
``` math
    p(3)
    =
    1 - \frac{1}{u(3)}
```
と書き換えることができる。ここで$`u(3)`$は次で定義される定積分である:
``` math
    u(3) 
    :=
    \int_{-\pi}^{\pi} \int_{-\pi}^{\pi} \int_{-\pi}^{\pi} \frac{\mathrm{d}^3k}{(2\pi)^3} \frac{3}{3 - \cos{k_1} - \cos{k_2} - \cos{k_3}}.
```
この積分は解析的に実行することができないので，数値積分によって評価する必要がある。



## シミュレーションによる評価
### 方法
本プロジェクトでは$`p(3)`$を次のように求める:

1. $`N_\mathrm{step}`$歩のランダムウォークを実行する。この際，原点に戻ったかどうか記録する。
1. $`N_\mathrm{cycle}`$回1.を実行する。
1. 1.及び2.により$`p(3) \simeq (N_\mathrm{step} \text{歩のランダムウォークで原点に戻る確率})`$を求める。
    
但しここで$`N_\mathrm{step}, \, N_\mathrm{cycle}`$は十分大きい値を取るとする。


### コード
ここではRandomWalk.jlの内容について解説する。

#### 1.ランダムウォークの実行
$`N_\mathrm{step}`$歩のランダムウォークを実行は，関数randomwalk()で行う。具体的にrandomwalk()の内容は次である。
``` julia
function randomwalk()
    step = 100_000
    counter = 0
    x, y, z = 0, 0, 0

    for i in 1:step
        direction = rand(["x_direction", "y_direction", "z_direction"])

        if direction == "x_direction"
            x += rand([-1, 1])
        elseif direction == "y_direction"
            y += rand([-1, 1])
        elseif direction == "z_direction"
            z += rand([-1, 1])
        end

        if x == 0 && y == 0 && z == 0
            counter += 1
            break
        end

    end

    return counter
end
```
- stepで$`N_\mathrm{step}`$を指定する。今回は$`N_\mathrm{step} = 100000`$とした。
- for文により$`1`$歩進むことを$`N_\mathrm{step}`$回繰り返す。
- $`x, \, y, \, z`$方向をランダムに選んだ後に，進むか戻るかをランダムに選ぶ。
- 粒子が原点に戻った場合，counterを1増加してfor文を終了する。
- for文が終了するとcounterをreturnする。counterが0は原点に戻らなかった場合，counterが1は原点に戻った場合に対応している。

#### 2.複数回の実行
$`N_\mathrm{cycle}`$回のランダムウォークの実行は，関数cycler()で行う。具体的に関数cycler()の内容は次である。
``` julia
using Base.Threads

function cycler()
    cycle = 100_000
    total_counter = Threads.Atomic{Int}(0)

    @threads for i in 1:cycle
        Threads.atomic_add!(total_counter, randomwalk())
    end

    println("probability = $(total_counter[] / cycle)")
end
```
- juliaの標準ライブラリであるBase.Threadsを用いる。
- cycleで$`N_\mathrm{cycle}`$を指定する。今回は$`N_\mathrm{cycle} = 100000`$とした。
- for文により並列処理で$`N_\mathrm{cycle}`$回ランダムウォークを実行する。
- atomicとは複数のスレッドが同時に同じ変数にアクセスしても，値の読み書きが安全に行われる操作である。
- total_counterは複数回randomwalk()を実行して得られるcounterの和である。
- total_counterを$`N_\mathrm{cycle}`$で割ることにより$`p(3)`$を得る。


## 結果
シミュレーションの実行結果は以下のようになった。
``` julia
(@v1.11) pkg> activate .

julia> using RandomWalk

julia> RandomWalk.cycler()
probability = 0.34189
```