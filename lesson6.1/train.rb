
class Train 
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_reader :number, :route, :wagons
  @@trains = {}
  
  def initialize(number)  
    @number = number
    @wagons = []
    @speed = 0
    @route = nil
    @current_station = nil
    validate_train!
    @@trains[number] = self
  end

  def self.find(number)
    @@trains[number]
  end

 
  protected def stop
    @speed = 0
  end
 
  def take_route(route)               
    @route = route
    @current_station = route.stations.first
    #puts "поезду #{number} присвоен маршрут #{route.stations.first.name} #{route.stations.last.name}"
    route.stations.first.train_reception(self)
  end                                      

  def next_station
    if @current_station!= route.stations.last
      #puts "следующая станция #{route.stations[self.indx + 1].name}"
      route.stations[self.indx + 1]
    else
      #puts "конечная станция #{route.stations.last.name}"
      route.stations.last
    end
  end
 
  def prev_station
    if @current_station!= route.stations.first
      #puts "Предыдущая станция #{route.stations[self.indx - 1].name}"
      route.stations[self.indx - 1]
    else
      #puts "Стартовая станция маршрута #{route.stations.first.name}"
      route.stations.first
    end
  end

  def move_forward_station
    if @current_station.name!= route.stations.last.name
     route.stations[self.indx].train_dispatch(self)
     @current_station = self.next_station             
     @current_station.train_reception(self)
   else
    false
   end
  end
 
  def move_back_station
    if @current_station.name!= route.stations.first.name
     route.stations[self.indx].train_dispatch(self)
     @current_station = self.prev_station
     @current_station.train_reception(self)
   else
    end
  end

   protected def indx
    indx = route.stations.index(@current_station)
  end
end









