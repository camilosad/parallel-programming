#encoding: UTF-8
require 'thread'
mutex = Mutex.new
cv = ConditionVariable.new

thread = Thread.new{
    print "Informe o número de repetições: "
    n = gets.chomp.to_i

    t1 = rand(1..10)
    t2 = rand(1..10)
    t3 = rand(1..10)

    puts "A thread 'Vermelho' dormirá por #{t1} segundos."
    puts "A thread 'Amarelo' dormirá por #{t2} segundos."
    puts "A thread 'Verde' dormirá por #{t3} segundos."

    red = Thread.new{
        n.times do |i|
            mutex.synchronize {
                sleep(t1)
                puts "\nVERMELHO"
                cv.signal
                cv.wait(mutex)
            }
        end
    }

    green = Thread.new{
        n.times do |i|
            mutex.synchronize {
                cv.wait(mutex)
                sleep(t3)
                puts "VERDE\n"
                cv.signal
            }
        end
    }

    yellow = Thread.new{
        n.times do |i|
            mutex.synchronize {
                cv.wait(mutex)
                sleep(t2)
                puts "AMARELO"
                cv.signal
            }
        end
    }

    red.join
    yellow.join
    green.join
}

thread.join
