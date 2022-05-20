
arr = [0, 1]

loop do
  next_arr = arr[-1] + arr[-2] 
  break if next_arr >= 100
  arr << next_arr
end

puts arr
