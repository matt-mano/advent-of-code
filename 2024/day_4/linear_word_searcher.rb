start = Time.now

def load_grid
  File.read("word_search.txt").split("\n").map(&:chars)
end

def find_pairs(row_index, col_index, max_row, max_col)
  pair_sets = []

  pair_sets << [[row_index - 1, col_index - 1], [row_index - 2, col_index - 2], [row_index - 3, col_index - 3]]
  pair_sets << [[row_index - 1, col_index - 0], [row_index - 2, col_index - 0], [row_index - 3, col_index - 0]]
  pair_sets << [[row_index - 1, col_index + 1], [row_index - 2, col_index + 2], [row_index - 3, col_index + 3]]

  pair_sets << [[row_index + 1, col_index - 1], [row_index + 2, col_index - 2], [row_index + 3, col_index - 3]]
  pair_sets << [[row_index + 1, col_index - 0], [row_index + 2, col_index - 0], [row_index + 3, col_index - 0]]
  pair_sets << [[row_index + 1, col_index + 1], [row_index + 2, col_index + 2], [row_index + 3, col_index + 3]]

  pair_sets << [[row_index, col_index - 1], [row_index, col_index - 2], [row_index, col_index - 3]]
  pair_sets << [[row_index, col_index + 1], [row_index, col_index + 2], [row_index, col_index + 3]]

  pair_sets.select do |set|
    set.all? { |pair| pair[0] >= 0 && pair[0] < max_row && pair[1] >= 0 && pair[1] < max_col }
  end
end

def check_if_christmas(pair_set, grid)
  grid[pair_set[0][0]][pair_set[0][1]] == "M" && grid[pair_set[1][0]][pair_set[1][1]] == "A" && grid[pair_set[2][0]][pair_set[2][1]] == "S"
end

grid = load_grid
count = 0

grid.each_with_index do |row, row_index|
  row.each_with_index do |char, col_index|
    if char == "X"
      pair_sets = find_pairs(row_index, col_index, grid.length, grid[0].length)
      count += pair_sets.select { |pair_set| check_if_christmas(pair_set, grid) }.length
    end
  end
end


puts "Count - #{count}"

puts "Took #{(Time.now - start) * 1000 } milliseconds"