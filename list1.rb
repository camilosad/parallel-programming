# utils

ACTIVE_NUMBERS = [1, 2, 4];

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
  puts 'NUMBER 1 SKIPPED'
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
  mmt == id
end

puts " ----------- NUMBER 2 -------------"
if (ACTIVE_NUMBERS.include? 2)
  rows = 3
  cols = 3
  range_start = 1
  range_end = 30

  A = Array.new(rows) { Array.new(cols) }
  setup_matrix A, rows, cols, range_start, range_end

  At = Array.new(rows) { Array.new(cols) }
  set_transposed(A, At, rows, cols)

  AAt = Array.new(rows) { Array.new(cols) }
  set_product(A, At, AAt, rows, cols)

  Ai = Array.new(rows) { Array.new(cols) }
  set_identity(A, Ai, rows, cols)

  print_matrix A, rows, cols
  print_matrix At, rows, cols
  print_matrix AAt, rows, cols
  print_matrix Ai, rows, cols

  puts ortogonal?(AAt, Ai) ? "Ortogonal" : "Nao Ortogonal"
else
  puts 'NUMBER 2 SKIPPED'
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
  A = []
  set_array(A, 25)
  puts "Unsorted array"
  print_array(A)
  sort_array(A)
  puts "Sorted array"
  print_array(A)
else
  puts 'NUMBER 3 SKIPPED'
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
  A = []
  populate_array_with_randoms(A, 1, 50)
  puts "Original array"
  print_array(A)
  separate_even_odd(A)
  puts "Resulting array"
  print_array(A)
else
  puts 'NUMBER 4 SKIPPED'
end




