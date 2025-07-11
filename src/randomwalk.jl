module RandomWalk


# 高速化のために並列処理で実行してみたいなあ


# ランダムウォークのシミュレーションを行う関数
# ランダムにx, y, zのいずれかの方向を選び、-1または1の値を加算する
# step回までに原点に戻った場合はcounterを1増やし、breakでループを抜ける
# step回までに原点に戻った場合はcounter=1としてreturnして渡す
function randomwalk()
    step = 10000
    # step = 10 # デバッグ用
    # stepcounter = 0 # デバッグ用
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

        # println("Step $i: ($x, $y, $z)") # デバッグ用

        if x == 0 && y == 0 && z == 0
            counter += 1
            # stepcounter = i # デバッグ用
            break
        end

        # stepcounter = step # デバッグ用
    end

    # println("stepcounter = $stepcounter, counter = $counter") # デバッグ用

    return counter
end


# 複数回ランダムウォークを実行する関数
# randomwalk()から受け取ったcounterの平均を計算することで原点に戻る確率を計算する
function cycler()
    cycle = 10000
    # cycle = 10 # デバッグ用
    total_counter = 0

    for i in 1:cycle
        total_counter += randomwalk()
        # randomwalk() # デバッグ用
    end

    println("probability = $(total_counter / cycle)")
end


# 関数の呼び出し
cycler()
# randomwalk() # デバッグ用

end