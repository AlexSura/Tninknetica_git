class Route
  include InstanceCounter
  include Validate
  attr_reader :stations, :first_station, :last_station

  def initialize (first_station, last_station)     
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    validate_route!
  end
  
  def add_station(station)                       
    self.stations.insert(-2, station)              
    puts "К маршруту #{stations.first.name} - #{stations.last.name} добавлена станция #{station.name}"
  end
  
  def delete_station(station)
    if @stations.size > 2                   
    self.stations.delete(station)
    puts "из маршрута #{stations.first.name} #{stations.last.name} удалена станция: #{station.name}"  
    else
    "в Маршруте должны быть минимум ө станции"
    end  
  end
  
  def list_station                              
    stations.each_with_index{|station, index| puts "#{index} : станция #{station.name}"}
  end
end
