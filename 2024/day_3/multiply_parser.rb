start = Time.now

def load_code
  File.read("code.txt")
end

code = load_code
matches = code.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/)

unsafe_sum = 0
safe_sum = 0
doing = true

matches.each do |match|
  if match[0] == "do()"
    doing = true
  elsif match[0] == "don\'t()"
    doing = false
  else
    sum = match[0].scan(/\d+/).map { |num| num.to_i }.reduce(:*)
    unsafe_sum += sum
    safe_sum += sum if doing
  end
end

puts "Initial sum - #{unsafe_sum}"
puts "Safe sum - #{safe_sum}"
puts "Took #{(Time.now - start) * 1000 } milliseconds"