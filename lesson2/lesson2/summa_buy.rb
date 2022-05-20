
hs = {}
cart = {}
summa = 0

loop do
  puts 'введите наименование товара'
  name = gets.chomp
  break if name == "стоп"
  puts 'введите стоимость за штуку'
  price = gets.chomp.to_f
  puts 'введите количество товара'
  quanity = gets.chomp.to_f
  cart[name] = {'price' => price, 'quanity' => quanity}
end

 cart.each do |name, hs|
  summa += hs['price'] * hs['quanity']
end

  puts cart
  puts "Сумма в корзине состовляет #{summa}"
