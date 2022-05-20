puts "для вычесления квадратного уравнения введиите коэффиценты a b c "

a = gets.chomp
a = a.to_i
b = gets.chomp
b = b.to_i
c = gets.chomp
c = c.to_i

d = (b**2) - (4 * a * c) 

if d < 0
  puts " #{d} Корней нет"
elsif d == 0
  x1 = -b/2 * a
  puts " дискриминант равен = #{d} и один корень #{x1}"
else
  x1 = ( -b + Math.sqrt(d))/(a * 2)
  x2 = (-b - Math.sqrt(d))/(a * 2)
  puts " дискриминант равен = #{d} уравнение имеет два корня #{x1} #{x2}"
end
