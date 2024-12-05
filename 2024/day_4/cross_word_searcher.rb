start = Time.now

def load_grid
  File.read("word_search.txt").split("\n").map(&:chars)
end

# M . S
# . A .
# M . S

# M . M
# . A .
# 

valid_mas = [['M','S','M','S'], ['M','M','S','S'], ['S','M','S','M'], ['S','S','M','M']]

def extract_mas(grid, row_index, col_index)
  [grid.dig(row_index - 1, col_index - 1), grid.dig(row_index - 1, col_index + 1), grid.dig(row_index + 1, col_index - 1), grid.dig(row_index + 1, col_index + 1)]
end

def is_valid_mas(mas, valid_mas)
  valid_mas.include?(mas)
end

grid = load_grid
count = 0

grid.each_with_index do |row, row_index|
  row.each_with_index do |char, col_index|
    if char == "A"
      possible_mas = extract_mas(grid, row_index, col_index)
      count += 1 if is_valid_mas(possible_mas, valid_mas)
    end
  end
end

puts "Count - #{count}"

puts "Took #{(Time.now - start) * 1000 } milliseconds"