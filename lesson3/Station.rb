class Station

  attr_reader :name_station, :trains

def initialize(name_station)                     #создание станции (указываем имя)
  @name_station = name_station
  @trains = []
end

def train_reception(train)                       #прием поезда 1н за раз
  trains << train
end

def list_trains_types(type = nil)                            #список по типу поездов
  if type 
    puts "На станции #{name_station} типа #{type}"
    trains.each {|train| puts train.number if train.type == type}
  else
    puts "На станции #{name_station}"
    trains.each {|train| puts train.number}
  end
end

def train_dispatch(train)                        #отправка поезда одного за раз указать номер поезда
  @trains.delete(train.number)
  train.station = nil
  puts "со станции #{name_station} отправился поезд #{train.number}"
end
end 


class Route

attr_accessor :stations, :first_station, :last_station 

def initialize(first_station, last_station)     #создаем маршрут с указанение начальной и конечной станции
  @stations = [first_station, last_station]
end

def add_sttn_btwn(station)                       # метод добавляет промежуточную станцию к маршруту
  self.stations.insert(-2, station)             #insert добвляет елемент в массив по указанному индексу 
  puts "К маршруту #{stations.first} - #{stations.last} добавлена станция #{station.name_station}"
end

def delete_sttn_btwn(station)                   # удаление промежуточной станции из маршрута
  self.stations.delete(station)
  puts "из маршрута #{stations.first} #{stations.last} удалена станция: #{station.name_station}"  
end

def list_station                                # выводит список станций маршрута
  stations.each {|station| puts "станция #{station}"}
end
end


class Train 
  attr_accessor :speed, :wagons, :number, :station, :route
  attr_reader :type

def initialize(number, type, wagons)            #создание поезда с указанными атрибутами, поезд при создании имеет нулевую скорость
  @number = number
  @wagons = wagons
  @type = type
  @speed = 0
  puts "Поезд #{number} собран и готов к движению, поезд #{type} и имеет #{wagons} вагонов"
  puts "Прицепка и отцепка вагонов осуществялеться при нулевой скорости поезда и атрибутов 'прицеп','отцеп'"
end

def stop
  self.speed = 0
end

def uncoupling(uncoupling)                      # прицеп отцеп вагона 
  if self.speed == 0 && uncoupling == 'прицеп'
    self.wagons +=1
    elsif self.speed == 0 && uncoupling == 'отцеп'
      self.wagons -=1
    else 
      puts "состав не остановлен"
    end
  end

def take_route(route)                           # поезду присвоен экз класса route т е маршрут
  self.route = route
  puts "поезду #{number} присвоен маршрут #{route.stations.first} #{route.stations.last}"
end                                             #route.stations.first.name доступ к массиву и первому элементу

def go_to(station)                              # движение поезда на станцию
  if route.nil?                                 # если поезду не присвоен маршрут 
    puts "Задайте маршрут поезду take_route(route)"
  elsif @station == station
    puts "поезд уже находиться на станции #{station}"
  elsif route.stations.include?(station)        # Если указанная станция есть в массиве
    @station.train_dispatch(self) if @station   
    @station = station
    station.train_reception(self)
  else
    puts "#{station.name} нет в маршруте"
  end
end

def adjacent_stations                            # выводит соседнии станции 
  if route.nil?
    puts "задайте маршрут"
  else
    station_i = route.stations.index(station)
    puts "Поезд #{number} на станции #{station.name_station}"
    puts "Предыдущая станция #{route.stations[station_i - 1].name_station}" if station_i != 0
    puts "Следующая станция #{route.stations[station_i + 1]}" if station_i !=route.stations.size - 1
  end
end
end

station0 = Station.new('city1')
station1 = Station.new('city2')
station2 = Station.new('city3')
station3 = Station.new('city4')
station4 = Station.new('city5')
station5 = Station.new('city6')
station6 = Station.new('city7')

marsh = Route.new('LA', 'NY')

train1 = Train.new(100, 'gruz', 20)
train2 = Train.new(200, 'gruz', 30)
train3 = Train.new(300, 'pas', 15)
train4 = Train.new(400, 'pas', 17)


station0.train_reception(train1)
station0.train_reception(train2)
station0.train_reception(train3)

station0.list_trains_types

marsh.add_sttn_btwn(station1)
marsh.add_sttn_btwn(station2)
marsh.add_sttn_btwn(station3)
marsh.add_sttn_btwn(station4)

marsh.delete_sttn_btwn(station4)


puts train1.wagons
train1.uncoupling('прицеп')
puts train1.wagons
train1.uncoupling('отцеп')
puts train1.wagons

train4.take_route(marsh)
train4.go_to(station3)

train4.adjacent_stations


