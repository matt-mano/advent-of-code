# This version comes from a total misunderstanding of the problem.
# This will find XMAS in any chain - not ncessarily in a straight line.

start = Time.now

def load_grid
  File.read("mini_word_search.txt").split("\n").map(&:chars)
end

def find_pairs(row_index, col_index, max_row, max_col)
  pairs = [[row_index - 1, col_index - 1], [row_index - 1, col_index], [row_index - 1, col_index + 1], [row_index, col_index - 1], [row_index, col_index + 1],[row_index + 1, col_index - 1],[row_index + 1, col_index], [row_index + 1, col_index + 1]]
  pairs.select do |pair|
    pair[0] >= 0 && pair[0] < max_row && pair[1] >= 0 && pair[1] < max_col
  end
end

def letters_around(grid, row_index, col_index, letter, last_letter = nil)
  letter_count = 0
  if letter == "X" && last_letter == nil
    # puts "Found X"
    pairs = find_pairs(row_index, col_index, grid.length, grid[0].length)
    pairs.each do |pair|
      letter_count += letters_around(grid, pair[0], pair[1], grid[pair[0]][pair[1]], "X")
    end
  elsif letter == "M" && last_letter == "X"
    # puts "Found M"
    pairs = find_pairs(row_index, col_index, grid.length, grid[0].length)
    pairs.each do |pair|
      letter_count += letters_around(grid, pair[0], pair[1], grid[pair[0]][pair[1]], "M")
    end
  elsif letter == "A" && last_letter == "M"
    # puts "Found A"
    pairs = find_pairs(row_index, col_index, grid.length, grid[0].length)
    pairs.each do |pair|
      letter_count += letters_around(grid, pair[0], pair[1], grid[pair[0]][pair[1]],  "A")
    end
  elsif letter == "S" && last_letter == "A"
   # puts "Found S"
    return 1
  else
    # puts "Returning 0"
    return 0
  end

  letter_count
end

grid = load_grid
count = 0

grid.each_with_index do |row, row_index|
  row.each_with_index do |char, col_index|
    count += letters_around(grid, row_index, col_index, char) if char == "X"
  end
end


puts "Count - #{count}"

puts "Took #{(Time.now - start) * 1000 } milliseconds"