start = Time.now

require 'set'

def load_file
  File.read("safety_manuals_and_rules.txt").split("\n")
end

def rules_map(file)
  raw_rule_lines = file.select { |line| line.include?("|")}
  rule_lines = raw_rule_lines.map do |line|
    line.split("|").map(&:to_i)
  end

  rules = {}

  rule_lines.each do |line|
    before = line[0]
    after = line[1]

    if rules[after]
      rules[after].add(before)
    else
      rules[after] = Set[before]
    end
  end

  rules
end

def manuals_map(file)
  raw_manual_lines = file.select { |line| line.include?(",") }
  manual_lines = raw_manual_lines.map do |line|
    entries = line.split(",").map(&:to_i)
  end
end

def is_safe(manual, rules)
  manual.each_with_index do |char, idx|
    return false if manual[idx..manual.length].any? do |later|
      rules[char] && rules[char].include?(later)
    end
  end

  true
end

file = load_file
rules = rules_map(file)
manuals = manuals_map(file)

middle_number_safe_sums = manuals.select{ |m| is_safe(m, rules) }.reduce(0) do |acc, manual|
  acc + manual[manual.length / 2]
end

middle_number_unsafe_sums = manuals.select { |m| !is_safe(m, rules) }.reduce(0) do |acc, manual|
  sorted_manual = manual.sort do |a, b|
    rules[b] && rules[b].include?(a) ? -1 : 1
  end
  acc + sorted_manual[sorted_manual.length / 2]
end

puts "Middle number sums = #{middle_number_safe_sums}"
puts "Fixed middle sums = #{middle_number_unsafe_sums}"
puts "Took #{(Time.now - start) * 1000 } milliseconds"