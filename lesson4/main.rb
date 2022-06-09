require_relative 'train'
require_relative 'rout'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagons'
require_relative 'cargo_wagons'

puts "0 - выход"
  puts "1 - создать станцию"
  puts "2 - создать поезд "
  puts "3 - создать маршрут"
  puts "4 - назначить маршрут поезду "
  puts "5 - добавить вагон к поезду"
  puts "6 - отцеплять вагон от поезда"
  puts "7 - переместить поезд по маршруту вперед назад"
  puts "8 - просматривать список станций и список поездов на станции"

  stations = []
  trains = []
  route = []
  
loop do 
  print "укажите номер : "
  selected = gets.chomp.to_i
  case selected
  
  when 0
    puts "exit"
    break

  when 1
    puts "дайте имя станции "
    name = gets.chomp
    stations << Station.new(name)
    puts " станция #{name} создана"

  when 2 
    puts "укажите номер поезда : "
    number = gets.chomp.to_i
    puts "выберите тип поезда 1 - грузовой 2 - пассажирский"
    selected = gets.chomp.to_i
    case selected
    when 1
      trains << CargoTrain.new(number)
    when 2
      trains << PassengerTrain.new(number)
    else
      puts " введите тип 1 - грузовой или 2 - пассажирский"
    end

  when 3 #route
    puts "  укажите действие 1 - создать маршрут, 2 - добавить станцию к маршруту, 3 - удалить станцию из маршрута"
    selected = gets.chomp.to_i
    case selected
    when 1
    if stations.count >= 2
      stations.each_with_index{|station, index| puts "#{index} : #{station.name}" }
      puts 'укажите начальную станцию исходя из списка начиная с 0 '
      first_station = gets.chomp.to_i
      puts 'укажите конечную станцию исходя из списка начиная с 0'
      last_station = gets.chomp.to_i
      route << Route.new(stations[first_station], stations[last_station])
      puts " маршрут #{route[-1].stations.first.name} - #{route[-1].stations.last.name} создан"
    else
      puts "для создании маршрута необходимо содать минимум 2 станции"
    end

    when 2
      if route.empty?
        puts "создайте маршрут"
      else
        puts "укажите номер станции которую хотите добавить в маршрут"
        stations.each_with_index{ |station, index| puts "#{index} : #{station.name}" }
        selected = gets.chomp.to_i
        puts "выбирите маршрут в который нужно добавить станцию"
        route.each_with_index{|route, index| puts " #{index} : #{route.stations.first.name} - #{route.stations.last.name} "}
        selected_route = gets.chomp.to_i
        route[selected_route].add_station(stations[selected])
    end

    when 3
      if route.empty?
        puts "создайте маршрут"
      else
        puts "выбирите маршрут из которой нужно удалить станцию"
        route.each_with_index{|route, index| puts " #{index} : #{route.stations.first.name} - #{route.stations.last.name} "}
        selected_route = gets.chomp.to_i
        route[selected_route].list_station
        puts "укажите станцию которую нужно удалить"
        selected_station = gets.chomp.to_i
        route[selected_route].delete_station(stations[selected_station])
        puts "станция #{stations[selected_station].name} удалена"
      end

  end

  when 4 #назначить маршрут
    puts "какому поезду назначаем маршрут?"

    trains.each_with_index{|train, index| puts "#{index} : #{train.number}"}
    puts "выберите поезд начиная с нуля"
    train = gets.chomp.to_i
    puts "выберите маршрут для назначение выбранному поезду начиная с нуля"
    route.each_with_index {|route, index| puts "#{index} : #{route.stations.first.name} - #{route.stations.last.name}"}
    route_num = gets.chomp.to_i
    trains[train].take_route(route[route_num])
    puts " поезду #{trains[train].number} присвоен маршрут #{route[route_num].stations.first.name} - #{route[route_num].stations.last.name}"

  
  when 5 
    puts "укажите номер поезд для прицепа вагона от 0"
    trains.each_with_index{|train, index| puts "#{index} : #{train.number}" }    
    number_train = gets.chomp.to_i
    if trains[number_train].instance_of?(PassengerTrain)
      wagon = PassengerWagons.new
      trains[number_train].add_wagon(wagon)
    else
      wagon = CargoWagons.new
      trains[number_train].add_wagon(wagon)
    end

  when 6 #отцепка вагонов от поезда
    puts "укажите поезд от которого отцепляем вагон от 0"
    trains.each_with_index{|train, index| puts "#{index} : #{train.number}" }    
    number_train = gets.chomp.to_i
    trains[number_train].wagons.delete_at(-1)
    puts trains[number_train].wagons

  when 7 
    puts "1 - переместить поезд на одну станцию вперед, 2 - переместить поезд на одну станцию назад"
    selected = gets.chomp.to_i
    
    case selected
    
    when 1
      puts "укажите поезд который хотите переместить по индексу 0"
      trains.each_with_index{|train, index| puts "#{index} : #{train.number}" }    
      number_train = gets.chomp.to_i
      trains[number_train].move_forward_station
    when 2
      puts "укажите поезд который хотите переместить по индексу 0"
      trains.each_with_index{|train, index| puts "#{index} : #{train.number}" }    
      number_train = gets.chomp.to_i
      trains[number_train].move_back_station
    end

  when 8
    stations.each do |station|
      station.list_trains
      puts station.name
    end

end
end


    






=begin
station0 = Station.new('city1')
station1 = Station.new('city2')
station2 = Station.new('city3')
station3 = Station.new('city4')
station4 = Station.new('city5')
station5 = Station.new('city6')
station6 = Station.new('city7')



marsh = Route.new(station4, station5)
=end

=begin

train1 = Train.new(100, 'gruz', 20)
train2 = Train.new(200, 'gruz', 30)
train3 = Train.new(300, 'pas', 15)
train4 = Train.new(400, 'pas', 17)
train5 = Train.new(500, 'pas', 17)


station0.train_reception(train1)
station0.train_reception(train2)
station0.train_reception(train3)
station0.train_reception(train5)

puts '8' * 80
station0.list_trains
station0.train_dispatch(train2)
station0.list_trains

marsh.add_station(station1)
marsh.add_station(station2)
marsh.add_station(station3)
marsh.add_station(station4)

marsh.delete_station(station4)


train4.take_route(marsh)


puts '80'*80
marsh1 = Route.new(station6, station5)
marsh1.add_station(station3)
train4.take_route(marsh1)
station6.list_trains
puts '90' * 80
puts "77"*80
train4.next_station
train4.prev_station
train4.move_forward_station
train4.move_forward_station
station5.list_trains
station3.list_trains
train4.move_back_station
station3.list_trains 
train4.move_back_station
train4.move_back_station
station6.list_trains
train4.next_station
train4.prev_station
train4.move_forward_station
train4.next_station
train4.prev_station
train4.move_forward_station
train4.next_station
train4.prev_station
puts "8"*80
puts "8"*80

station0.list_trains_types('pas')
station0.list_trains_types('gruz')
station0.list_trains
puts '*'*80
puts station5.list_trains_types('pas').inspect
station5.list_trains
=end
