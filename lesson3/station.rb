class Station
  attr_reader :name, :trains

  def initialize(name)                     #создание станции (указываем имя)
    @name = name
    @trains = []
  end
  def train_reception(train)                       #прием поезда 1н за раз
    trains << train
  end
  def list_trains_types(type = nil)                            #список по типу поездов
    if type 
      puts "На станции #{name} типа #{type}"
      trains.each {|train| puts train.number if train.type == type}
    else
      puts "На станции #{name}"
      trains.each {|train| puts train.number}
    end
  end
  def train_dispatch(train)                        #отправка поезда одного за раз указать номер поезда
    @trains.delete(train)
    puts "со станции #{name} отправился поезд #{train.number}"
  end
  def list_trains
    trains.each{ |train| puts train.number }
  end 
end


class Route
  attr_reader :stations 
  #attr_accessor :stations, :first_station, :last_station 

  def initialize(first_station, last_station)     #создаем маршрут с указанение начальной и конечной станции
    @stations = [first_station, last_station]
  end
  def add_station(station)                       # метод добавляет промежуточную станцию к маршруту
    self.stations.insert(-2, station)             #insert добвляет елемент в массив по указанному индексу 
    puts "К маршруту #{stations.first.name} - #{stations.last.name} добавлена станция #{station.name}"
  end
  def delete_station(station)                   # удаление промежуточной станции из маршрута
    self.stations.delete(station)
    puts "из маршрута #{stations.first.name} #{stations.last.name} удалена станция: #{station.name}"  
  end
  def list_station                                # выводит список станций маршрута
    stations.each {|station| puts "станция #{station}"}
  end
end


class Train 
  #attr_accessor :speed, :wagons, :number, :station, :route
  attr_reader :type, :number, :route

  def initialize(number, type, wagons)            #создание поезда с указанными атрибутами, поезд при создании имеет нулевую скорость
    @number = number
    @wagons = wagons
    @type = type
    @speed = 0
    @route = nil
    @current_station = nil
    puts "Поезд #{number} собран и готов к движению, поезд #{type} и имеет #{wagons} вагонов"
    puts "Прицепка и отцепка вагонов осуществялеться при нулевой скорости поезда и атрибутов 'прицеп','отцеп'"
  end
  def stop
    @speed = 0
  end
  def add_wagon
    if self.speed == 0 
      self.wagons+= 1
    else
      puts "Остановите поезд что прицепить вагон"
    end
  end
  def remove_wagon 
    if self.speed == 0 
      self.wagons-= 1
    else
      puts "Остановите поезд что отцепить вагон"
    end
  end
  def take_route(route)                           # поезду присвоен экз класса route т е маршрут
    @route = route
    @current_station = route.stations.first
    route.stations.first.train_reception(self)
    puts "поезду #{number} присвоен маршрут #{route.stations.first.name} #{route.stations.last.name}"
  end                                             #route.stations.first.name доступ к массиву и первому элементу
  def move_forward_station
    if @current_station.name!= route.stations.last.name
     current_i =  route.stations.index(@current_station)
     route.stations[current_i].train_dispatch(self)
     current_ii = current_i + 1
     @current_station = route.stations[current_ii]
     route.stations[current_ii].train_reception(self)
     puts " поезд перемещен на станцию #{@current_station.name}"
   else
    puts "позед прибыл на конечную станцию #{route.stations.last.name}"
   end
  end
  def move_back_station
    if @current_station.name!= route.stations.first.name
     current_i =  route.stations.index(@current_station)
     route.stations[current_i].train_dispatch(self)
     current_ii = current_i - 1
     @current_station = route.stations[current_ii]
     route.stations[current_ii].train_reception(self)
     puts " поезд перемещен на станцию #{@current_station.name}"
   else
    puts "поезд находиться на первой станции #{@current_station.name}"
  end
  end
  def next_station
    if @current_station!= route.stations.last
      staions_i = route.stations.index(@current_station)
      next_station = route.stations[staions_i + 1]
      puts "следующая станция #{route.stations[staions_i + 1].name}"
    else
      route.stations.last
      puts "конечная станция #{route.stations.last.name}"
    end
  end
  def prev_station
    if @current_station!= route.stations.first
      station_i = route.stations.index(@current_station)
      prev_station = route.stations[station_i - 1]
      puts "Предыдущая станция #{prev_station.name}"
    else
      route.stations.first
      puts "Стартовая станция маршрута #{route.stations.first.name}"
    end
  end
  def adjacent_stations                            # выводит соседнии станции 
    if route.nil?
      puts "задайте маршрут"
    else
      station_i = route.stations.index(station)
      puts "Поезд #{number} на станции #{station.name}"
      puts "Предыдущая станция #{route.stations[station_i - 1].name}" if station_i != 0
      puts "Следующая станция #{route.stations[station_i + 1].name}" if station_i !=route.stations.size - 1
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

marsh = Route.new(station4, station5)

train1 = Train.new(100, 'gruz', 20)
train2 = Train.new(200, 'gruz', 30)
train3 = Train.new(300, 'pas', 15)
train4 = Train.new(400, 'pas', 17)


station0.train_reception(train1)
station0.train_reception(train2)
station0.train_reception(train3)

station0.list_trains_types
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


#train4.adjacent_stations
puts '80'*80
marsh1 = Route.new(station6, station5)
marsh1.add_station(station3)
train4.take_route(marsh1)
station6.list_trains
puts '90' * 80
puts "77"*80
train4.move_forward_station
puts '90' * 80
puts "77"*80
train4.move_forward_station
train4.move_forward_station
station5.list_trains
station3.list_trains #удаляет поезд
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


