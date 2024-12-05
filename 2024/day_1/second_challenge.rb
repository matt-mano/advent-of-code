data = File.read("./input.txt").split("\n").map{ |line| line.split(" ") }
first = data.map { |line| line[0].to_i }

second_frequencies = {}
data.map { |line| line[1].to_i }.each do |s|
  if second_frequencies[s]
    second_frequencies[s] += 1
  else
    second_frequencies[s] = 1
  end
end

acc = 0
first.each do |f| 
  count = second_frequencies[f]
  if count 
    acc += f * count
  end
end

puts acc