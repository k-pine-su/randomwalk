# ランダムウォークのシミュレーションを行う関数
# directionで進む方向x,y,zをランダムに選び，進む量もランダムで選ぶ
function toy()
    x, y, z = 0, 0, 0
    steps = 10
    for i in 1:steps
        direction = rand(["x_direction", "y_direction", "z_direction"])
        if direction == "x_direction"
            x += rand([-1, 1])
        elseif direction == "y_direction"
            y += rand([-1, 1])
        elseif direction == "z_direction"
            z += rand([-1, 1])
        end
        println("Step $i: ($x, $y, $z)")
    end    
    # return (x, y, z)
end