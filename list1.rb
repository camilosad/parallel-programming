ACTIVE_NUMBERS = [5];
# utils

def generate_random_between(initial_number, final_number)
  (initial_number..final_number).to_a.sample
end

def setup_matrix(empty_matrix, rows, columns, range_start, range_end)
  rows.times do |i|
    columns.times do |j|
      empty_matrix[i][j] = generate_random_between(range_start, range_end)
    end
  end
  empty_matrix
end

def number_to_s(number)
  number < 10 ? "0#{number}" : number.to_s
end

def print_matrix(matrix, rows, columns)
  rows.times do |i|
    columns.times do |j|
      print "#{number_to_s matrix[i][j]} "
    end
    puts ""
  end
end

def print_array(array)
  array.map{ |item| print "#{item} " }
  puts ''
end

####################

# 1

def get_min(matrix)
  1
end

def get_max(matrix)
  5
end

def satisfy_condition?(matrix)
  get_min(matrix) <= get_max(matrix)
end

def print_output(matrix)
  puts satisfy_condition?(matrix) ? "Condicao Satisfeita" : "Condicao Nao Satisfeita"
end

puts " ----------- NUMBER 1 -------------"
if (ACTIVE_NUMBERS.include? 1)
  rows = 4
  cols = 5
  range_start = 1
  range_end = 20
  A = Array.new(rows) { Array.new(cols) }
  setup_matrix A, rows, cols, range_start, range_end
  print_matrix A, rows, cols
  print_output A
else
  puts 'SKIPPING IT'
end

#######################

# 2

def set_transposed(matrix, result, rows, cols)
  rows.times do |i|
    cols.times do |j|
      result[j][i] = matrix[i][j]
    end
  end
end

def set_product(matrix1, matrix2, result, rows, cols)
  rows.times do |i|
    cols.times do |j|
      sum = 0
      rows.times do |k|
        sum += matrix1[i][k] * matrix2[k][j]
      end
      result[i][j] = sum
    end
  end
end

def set_identity(matrix, result, rows, cols)
  rows.times do |i|
    cols.times do |j|
      result[i][j] = i == j ? 1 : 0
    end
  end
end

def ortogonal?(mmt, id)
  mmt.each_with_index do |item1, i|
    item1.each_with_index do |item2, j|
      return false if item2 != id[i][j]
    end
  end
  true
end

puts " ----------- NUMBER 2 -------------"
if (ACTIVE_NUMBERS.include? 2)
  rows = 3
  cols = 3
  range_start = 1
  range_end = 30

  matrix = Array.new(rows) { Array.new(cols) }
  setup_matrix matrix, rows, cols, range_start, range_end

  matrixT = Array.new(rows) { Array.new(cols) }
  set_transposed(matrix, matrixT, rows, cols)

  mmt = Array.new(rows) { Array.new(cols) }
  set_product(matrix, matrixT, mmt, rows, cols)

  matrixI = Array.new(rows) { Array.new(cols) }
  set_identity(matrix, matrixI, rows, cols)

  print_matrix matrix, rows, cols
  print_matrix matrixT, rows, cols
  print_matrix mmt, rows, cols
  print_matrix matrixI, rows, cols

  puts ortogonal?(mmt, matrixI) ? "Ortogonal" : "Nao Ortogonal"
else
  puts 'SKIPPING IT'
end

#######################

# 3

def set_array(array, size)
  size.times do |index|
    print 'Insert number: '
    number = gets.chomp
    array.push number.to_i
  end
end


def sort_array(array)
  loop do
    swapped = false

    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  array
end

puts " ----------- NUMBER 3 -------------"
if (ACTIVE_NUMBERS.include? 3)
  array = []
  set_array(array, 25)
  puts "Unsorted array"
  print_array(array)
  sort_array(array)
  puts "Sorted array"
  print_array(array)
else
  puts 'SKIPPING IT'
end


#######################

# 4

def populate_array_with_randoms(array, initial_random, final_random)
  20.times { |i| array.push generate_random_between(initial_random, final_random) }
end

def separated?(array)
  evens_count = array.select { |item| item.even? }.count

  array.each_with_index do |item, index|
    return false if (index <= (evens_count - 1) and item.odd?)
  end

  true
end

def separate_even_odd(array)
  loop do |index|
    array.each_with_index do |item, index|
      if item.odd?
        x = array.delete_at index
        array.push x
      end
    end
    break if separated?(array)
  end

  array
end

puts " ----------- NUMBER 4 -------------"
if (ACTIVE_NUMBERS.include? 4)
  array = []
  populate_array_with_randoms(array, 1, 50)
  puts "Original array"
  print_array(array)
  separate_even_odd(array)
  puts "Resulting array"
  print_array(array)
else
  puts 'SKIPPING IT'
end


#######################

# 5

def wrong_position?(number, index)
  return true if (number.even? and index.even?)
  return true if (number.odd? and index.odd?)
  false
end

def any_wrong_position?(array)
  array.each_with_index{ |item, index| return true if wrong_position?(item, index) }
  false
end

def first_invalid_element(array)
  array.each_with_index{ |item, index| return index if wrong_position?(item, index) }
  return nil
end

def populate_array_even_odd(array)
  evens, odds = 0, 0

  while array.size < 20 do
    random = generate_random_between(0, 100)
    if (random.even? and evens < 10)
      array.push random
      evens += 1
    elsif (random.odd? and odds < 10)
      array.push random
      odds += 1
    end
  end
end

def organize_array(array)
  loop do
    array.each_with_index do |item, index|
      if wrong_position?(item, index)
        x = array[index]
        sub_array = array[(x+1)..(array.size)]
        next_invalid_index = first_invalid_element(sub_array)
        array[index] = array[next_invalid_index]
        array[next_invalid_index] = x
      end
    end
    break if any_wrong_position?(array)
  end
  array
end

puts " ----------- NUMBER 5 -------------"
if (ACTIVE_NUMBERS.include? 5)
  array = []
  populate_array_even_odd(array)
  puts "Original array"
  print_array(array)
  puts "Resulting array"
  print_array(array)
else
  puts 'SKIPPING IT'
end


#######################


#######################

# 6

def fatorial(n)
  return n if n == 1
  return n * fatorial(n - 1)
end

puts " ----------- NUMBER 6 -------------"
if (ACTIVE_NUMBERS.include? 6)
  print 'Insert number: '
  number = gets.chomp
  puts "Fatorial 5: #{fatorial(number.to_i)}"
else
  puts 'SKIPPING IT'
end


#######################

# 7

def exp(a, b)
  return a if b == 1
  return a * exp(a, b - 1)
end

puts " ----------- NUMBER 7 -------------"
if (ACTIVE_NUMBERS.include? 7)
  print 'Insert number a: '
  a = gets.chomp
  print 'Insert number b: '
  b = gets.chomp
  puts "aˆb: #{exp(a.to_i, b.to_i)}"
else
  puts 'SKIPPING IT'
end


#######################

# 8

def find_max(array)
  return array.first if array.size == 1
  index_to_remove = array[0] <= array[1] ? 0 : 1
  array.delete_at index_to_remove
  return find_max(array)
end

puts " ----------- NUMBER 8 -------------"
if (ACTIVE_NUMBERS.include? 8)
  array = []
  populate_array_with_randoms(array, 1, 40)
  puts "Generated Array:"
  print_array(array)
  puts "largest number: #{find_max(array)}"
else
  puts 'SKIPPING IT'
end

