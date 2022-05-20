puts "введите значения трех сторон треугольника что бы определить его вид"

a = gets.chomp
a = a.to_i

c = gets.chomp
c = c.to_i

b = gets.chomp
b = b.to_i

hypotenuse = nil 

if a < c && b < c  # если С являеться  гипотенузой выполняюся условия для С
  hypotenuse = c

  if hypotenuse ** 2 == a ** 2 + b ** 2 #прямоугольный треугольник
	  puts " прямоугольный треугольник"
  elsif hypotenuse == a && hypotenuse == b # равносторонний треугольник
	  puts " равносторонний треугольник"
  elsif hypotenuse == a || hypotenuse == b || a == b # рвнобедренный треугольник
	  puts " рaвнобедренный треугольник "
  else
	  puts " разносторонний треугольник "
  end
	
elsif b < a && c < a # Гипотенуза А
  hypotenuse = a

  if hypotenuse ** 2 == c ** 2 + b ** 2 #прямоугольный треугольник
	  puts " прямоугольный треугольник"
  elsif hypotenuse == c && hypotenuse == b # равносторонний треугольник
	  puts " равносторонний треугольник"
  elsif hypotenuse == b || hypotenuse == c || c == b # рвнобедренный треугольник
	  puts " рaвнобедренный треугольник "
	else
	  puts " разносторонний треугольник "
  end

elsif # Гитотенуза b

  hypotenuse = b

  if hypotenuse ** 2 == a ** 2 + c ** 2  #прямоугольный треугольник
	  puts " прямоугольный треугольник"
  elsif hypotenuse == a && hypotenuse == c # равносторонний треугольник
	  puts " равносторонний треугольник"
  elsif hypotenuse == a || hypotenuse == c || c == a # рвнобедренный треугольник
	  puts " рaвнобедренный треугольник "
	else
	  puts " разносторонний треугольник "
	end
end 
