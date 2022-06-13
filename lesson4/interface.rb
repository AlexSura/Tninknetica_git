
class Interface
  attr_reader :stations, :route, :trains
  
  def initialize 
    puts "0 - выход"
    puts "1 - создать станцию"
    puts "2 - создать поезд "
    puts "3 - создать маршрут"
    puts "4 - назначить маршрут поезду "
    puts "5 - добавить вагон к поезду"
    puts "6 - отцеплять вагон от поезда"
    puts "7 - переместить поезд по маршруту вперед назад"
    puts "8 - просматривать список станций и список поездов на станции"

    @stations = []
    @trains = []
    @route = []
  end

  private

  def new_station
    puts"дайте имя станции "
    name = gets.chomp
    @stations << Station.new(name)
    puts " станция #{name} cоздана"
  end

  def new_train
    puts "yкажите номер поезда : "
    number = gets.chomp.to_i
  puts "выберите тип поезда 1 - рузовой 2 -пассажирский"
    selected = gets.chomp.to_i
    
    case selected
    
    when 1
      @trains << CargoTrain.new(number)
    when 2
      @trains << PassengerTrain.new(number)
    else
      puts " введите ип 1 - грузовой или 2 - пассажирски "
    end
  end

  def new_route
    puts " укажите дейсвие 1 - создать маршрут, 2 - добавить станцию к маршруту, 3 - удалить станцию из маршрута"
    selected = gets.chomp.to_i
    
    case selected
    
    when 1
    if @stations.count >= 2
      @stations.each_with_index{|station, index| puts "#{index} : #{station.name}" }
      puts 'укажите начальную станцию исходя из списка начиная с 0'
      first_station = gets.chomp.to_i
      puts 'укажите конечнуюстанцию исходя из списка начинаяс 0'
      last_station = gets.chomp.to_i
      @route << Route.new(stations[first_station], stations[last_station])
      puts " маршрут #{self.route[-1].stations.first.name} - #{self.route[-1].stations.last.name} создан"
    else
      puts "для создании маршрута необходимо содать минимум 2 станции"
    end

    when 2
      if @route.empty?
        puts "создайте маршрут"
      else
        puts "укажите номер станции которую хотите добавить в маршрут"
        @stations.each_with_index{ |station, index| puts "#{index} : #{station.name}" }
        selected = gets.chomp.to_i
        puts "выбирите маршрут в который нужно добавить станцию"
        self.route.each_with_index{|route, index| puts " #{index} : #{route.stations.first.name} - #{route.stations.last.name} "}
        selected_route = gets.chomp.to_i
        self.route[selected_route].add_station(stations[selected])
    end

    when 3
      if self.route.empty?
        puts "создайте маршрут"
      else
        puts "выбирите маршрут из которой нужно удалить станцию"
        self.route.each_with_index{|route, index| puts " #{index} : #{route.stations.first.name} - #{route.stations.last.name} "}
        selected_route = gets.chomp.to_i
        self.route[selected_route].list_station
        puts "укажите станцию которую нужно удалить"
        selected_station = gets.chomp.to_i
        self.route[selected_route].delete_station(stations[selected_station])
        puts "станция #{self.stations[selected_station].name} удалена"
      end
    end
  end

  def give_route
    puts "какому поезду назначаем маршрут?"
    trains.each_with_index{|train, index| puts "#{index} : #{train.number}"}
    puts "выберите поезд начиная с нуля"
    train = gets.chomp.to_i
    puts "выберите маршрут для назначение выбранному поезду начиная с нуля"
    route.each_with_index {|route, index| puts "#{index} : #{route.stations.first.name} - #{route.stations.last.name}"}
    route_num = gets.chomp.to_i
    trains[train].take_route(route[route_num])
    puts " поезду #{trains[train].number} присвоен маршрут #{route[route_num].stations.first.name} - #{route[route_num].stations.last.name}"
  end

  def add_wagons
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
  end

  def delete_wagons
    puts "укажите поезд от которого отцепляем вагон от 0"
    trains.each_with_index{|train, index| puts "#{index} : #{train.number}" }    
    number_train = gets.chomp.to_i
    trains[number_train].wagons.delete_at(-1)
    puts trains[number_train].wagons
  end

  def move_train
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
  end

  def station_train
    @stations.each do |station|
    station.list_trains
    puts station.name
    end
  end

  public def call 
    loop do
    print "укажите номер : "
    selected = gets.chomp.to_i
  
    case selected
  
    when 0
    break

    when 1
    new_station

    when 2
    new_train
  
    when 3
    new_route

    when 4
    give_route

    when 5
    add_wagons    
  
    when 6
    delete_wagons

    when 7
    move_train

    when 8
    station_train
    end
  end
 
end
end

  
