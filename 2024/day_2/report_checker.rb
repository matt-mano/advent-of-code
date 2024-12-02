

def load_reports
  File.read("./reports.txt").split("\n").map{ |line| line.split(" ").map(&:to_i) }
end

def check_report(report)
  return true if report.length == 1

  if report[0] < report[1]
    decreasing = false
  elsif report[0] > report[1]
    decreasing = true
  else
    return false
  end
  
  report.each_with_index.all? do |value, index|
    next true if index == 0
    
    last = report[index - 1]
    if decreasing && (value >= last || (value - last).abs > 3)
      next false
    elsif !decreasing && (value <= last || (value - last).abs > 3)
      next false
    end

    true
  end
end

reports = load_reports

safe_reports = reports.select do |report|
  check_report(report)
end

safe_reports_with_problem_dampener = reports.select do |report|
  end_index = report.length - 1
  check_report(report) || (0..end_index).any? do |index|
    check_report(report[0...index].concat(report[(index + 1)..end_index]))
  end
end

puts "Safe reports count - #{safe_reports.length}"
puts "Safe reports with problem dampener count - #{safe_reports_with_problem_dampener.length}"