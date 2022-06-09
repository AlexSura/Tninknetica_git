class Station
  attr_reader :name, :trains

  def initialize(name)                     
    @name = name
    @trains = []
    @trains_pas = []
    @trains_gruz = [] 
  end
 
  def train_reception(train)                      
    trains << train
  end
 
  def list_trains_types(type)                           
    trains.select{|item| item.type == type} 
  end

  def train_dispatch(train)                        
    @trains.delete(train)
    puts "со станции #{name} отправился поезд #{train.number}"
  end
 
  def list_trains
    trains.each{ |train| puts "на станции #{@name} поезд #{train.number}" }
  end 
end








