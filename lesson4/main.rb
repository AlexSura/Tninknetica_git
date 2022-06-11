require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagons'
require_relative 'cargo_wagons'
require_relative 'interface'

puts "0 - выход"
  puts "1 - создать станцию"
  puts "2 - создать поезд "
  puts "3 - создать маршрут"
  puts "4 - назначить маршрут поезду "
  puts "5 - добавить вагон к поезду"
  puts "6 - отцеплять вагон от поезда"
  puts "7 - переместить поезд по маршруту вперед назад"
  puts "8 - просматривать список станций и список поездов на станции"


interface = Interface.new
loop do
  print "укажите номер : "
  selected = gets.chomp.to_i
  
  case selected
  
  when 0
    break

  when 1
    interface.new_station

  when 2
    interface.new_train
  
  when 3
    interface.new_route

  when 4
    interface.give_route

  when 5
    interface.add_wagons    
  
  when 6
    interface.delete_wagons

  when 7
    interface.move_train

  when 8
    interface.station_train
  end

