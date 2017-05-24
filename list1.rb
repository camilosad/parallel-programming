# utils

def generateRandomBetween(initialNumber, finalNumber)
  (initialNumber..finalNumber).to_a.sample
end

def setupMatrix(emptyMatrix, rows, columns, rangeStart, rangeEnd)
  rows.times do |i|
    columns.times do |j|
      emptyMatrix[i][j] = generateRandomBetween(rangeStart, rangeEnd)
    end
  end
  emptyMatrix
end

def number_to_s(number)
  number < 10 ? "0#{number}" : number.to_s
end

def printMatrix(matrix, rows, columns)
  rows.times do |i|
    columns.times do |j|
      print "#{number_to_s matrix[i][j]} "
    end
    puts ""
  end
end

####################

# 1

def getMin(matrix)
  1
end

def getMax(matrix)
  5
end

def satisfy_condition?(matrix)
  getMin(matrix) <= getMax(matrix)
end

def printOutput(matrix)
  puts satisfy_condition?(matrix) ? "Condicao Satisfeita" : "Condicao Nao Satisfeita"
end

rows = 4
cols = 5
rangeStart = 1
rangeEnd = 20
A = Array.new(rows) { Array.new(cols) }
setupMatrix A, rows, cols, rangeStart, rangeEnd
printMatrix A, rows, cols
printOutput A


#######################

# 2

def setTransposed(matrix, result, rows, cols)
  rows.times do |i|
    cols.times do |j|
      result[j][i] = matrix[i][j]
    end
  end
end

def setProduct(matrix1, matrix2, result, rows, cols)
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

def setIdentity(matrix, result, rows, cols)
  rows.times do |i|
    cols.times do |j|
      result[i][j] = i == j ? 1 : 0
    end
  end
end

def ortogonal?(mmt, id)
  mmt == id
end

rows = 3
cols = 3
rangeStart = 1
rangeEnd = 30

A = Array.new(rows) { Array.new(cols) }
setupMatrix A, rows, cols, rangeStart, rangeEnd

At = Array.new(rows) { Array.new(cols) }
setTransposed(A, At, rows, cols)

AAt = Array.new(rows) { Array.new(cols) }
setProduct(A, At, AAt, rows, cols)

Ai = Array.new(rows) { Array.new(cols) }
setIdentity(A, Ai, rows, cols)

printMatrix A, rows, cols
printMatrix At, rows, cols
printMatrix AAt, rows, cols
printMatrix Ai, rows, cols

puts ortogonal?(AAt, Ai) ? "Ortogonal" : "Nao Ortogonal"