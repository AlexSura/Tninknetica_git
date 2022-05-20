puts "Вас приветствует KiberDoc!"

puts " Введите имя "
name = gets.chomp
name = name.capitalize! 

puts " Введите ваш рост"
height_use = gets.chomp
height_use = height_use.to_i

ideal_weight = (height_use - 110)*1.15

if ideal_weight < 0
	puts "Ваш вес уже оптимальный"
else
	puts "#{name} ваш оптимальный вес #{ideal_weight}"
end
