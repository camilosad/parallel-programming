#Componentes do Grupo: Camilo Sad, Ícaro Siqueira e Nichollas Marvila
#encoding: UTF-8
require 'thread'
mutex = Mutex.new
cv = ConditionVariable.new

@lx = [[2, 0, 0],[1, 4, 0],[1, 1, 1]]
@b = [2, -3, 1]
@x = []
@somatorio = 0

soma = Thread.new{
    mutex.synchronize {
        for i in 0..2
            for j in 0..i
                @somatorio += @lx[i][j]
            end
        end
    }
}

calc_x = Thread.new{
    mutex.synchronize {
        for i in 0..2
            @x[i] = Float((@b[i] - @somatorio) / @lx[i][i])
            puts "x#{i+1}: #{@x[i]}"
        end
    }
}

soma.join
calc_x.join
