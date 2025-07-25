# ランダムウォークのシミュレーションを行う関数
# ランダムにx, y, zのいずれかの方向を選び、-1または1の値を加算する
# step回までの粒子の位置をdatファイルに出力する
function trace()
    step = 100000
    # step = 10 # デバッグ用
    x, y, z = 0, 0, 0

    open("trace.dat", "w") do io
        for i in 1:step
            direction = rand(["x_direction", "y_direction", "z_direction"])

            if direction == "x_direction"
                x += rand([-1, 1])
            elseif direction == "y_direction"
                y += rand([-1, 1])
            elseif direction == "z_direction"
                z += rand([-1, 1])
            end

            println(io, "$i $x $y $z") # 粒子の位置をdatファイルに出力

        end

    end

end