data = File.read("./input.txt").split("\n").map{ |line| line.split(" ") }
first = data.map { |line| line[0].to_i }.sort
second = data.map { |line| line[1].to_i }.sort

acc = 0
first.each_with_index do |f, i|
  acc += (second[i] - f).abs
end

puts acc