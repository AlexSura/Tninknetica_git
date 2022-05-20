puts " введите day"
day = gets.chomp.to_i
puts " введите месяц "
month = gets.chomp.to_i
puts "введите год"
year = gets.chomp.to_i

months = { 
  1 => 31, 
  2 => 28, 
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31 
    }

month_day = months[month]
arr1 = Array(1..month)

sum_days1 = months.slice(*arr1)
sum_days = sum_days1.values.sum
deduction = month_day - day

if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0 )
  serial_num = sum_days - deduction + 1
  puts "Порядковый номер #{serial_num}"
else
  serial_num = sum_days - deduction
  puts "Порядковый номер #{serial_num}"
end

