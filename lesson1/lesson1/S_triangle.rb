puts " Для расчета S (площадь) треугольника требуются переменные *основание и *высота"

puts " Введите значения основания 'a' "
a = Integer(gets.chomp)
a = a.to_i

puts " Введите значения высоты 'h' "
h = Integer(gets.chomp)
h = h.to_i

s = 0.5 * a * h 

puts " Площадь треугольника  S = #{s} "

