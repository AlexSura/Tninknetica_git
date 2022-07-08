
class Train 
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_reader :number, :route, :wagons, :name
  @@trains = {}
  
  def initialize(number)  
    @number = number
    @wagons = []
    @speed = 0
    @route = nil
    validate_train!
    @current_station = nil
    @@trains[number] = self
  end

   protected def indx
    indx = Station.all.index(@current_station)
  end

  def self.find(number)
    @@trains[number]
  end
 
  protected def stop
    @speed = 0
  end
 
  def take_route(route)               
    @route = route
    @current_station = Station.all[0]  #route.first_station
    #puts "поезду #{number} присвоен маршрут #{route.stations.first.name} #{route.stations.last.name}"
    @current_station.train_reception(self)
  end                                      

  def next_station
    if @current_station.name != Station.all.last.name
      #puts "следующая станция #{route.stations[self.indx + 1].name}"
      Station.all[self.indx + 1]
    else
      #puts "конечная станция #{route.stations.last.name}"
       route.last_station
    end
  end
 
  def prev_station
    if @current_station.name != route.first_station.name
      #puts "Предыдущая станция #{route.stations[self.indx - 1].name}"
      Station.all[self.indx - 1]
    else
      #puts "Стартовая станция маршрута #{route.stations.first.name}"
      route.first_station
    end
  end

  def move_forward_station
    if @current_station.name != Station.all.last.name
     Station.all[self.indx].train_dispatch(self)
     @current_station = self.next_station             
     puts " поезд перемещен на станцию #{@current_station.name}"
     @current_station.train_reception(self)
     Station.all.each{|x| puts x }
   else
    puts "позед прибыл на конечную станцию #{route.last_station.name}"
   end
  end
 
  def move_back_station
    if @current_station.name!= route.first_station.name
     Station.all[self.indx].train_dispatch(self)
     @current_station = self.prev_station
     @current_station.train_reception(self)
     puts " поезд перемещен на станцию #{@current_station.name}"
   else
    puts "поезд находиться на первой станции #{@current_station.name}"
    end
  end
end









