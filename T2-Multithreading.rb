#encoding: UTF-8

threads = []

4.times do |i|
   threads[i] = Thread.new {
      tempo = rand(1..20)
      puts "Eu sou a thread #{i} e vou dormir por #{tempo} segundos!"
      sleep(tempo)
      puts "Eu sou a thread #{i}. Já se passaram #{tempo} segundos e eu serei finalizada!"
   }
end

4.times do |i|
  threads[i].join
end

#threads.each {|t| t.join}
