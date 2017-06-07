threads = []

pp = Thread.new do
  while true
    puts 'Programação Paralela'
  end
end

iff = Thread.new do
  while true do
    puts 'Instituto Federal Fluminense'
  end
end

threads.push pp, iff
threads.each(&:join)