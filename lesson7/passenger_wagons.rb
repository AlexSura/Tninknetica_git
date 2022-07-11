class PassengerWagons < Wagon
 
 attr_reader :passager_seats, :loading_volume, :free_places, :number
  
  def initialize(passager_seats)
    super
    @passager_seats = passager_seats
  end

  def take_place
    @loading_volume += 1
  end

  def free_places
     free_places = @passager_seats - @loading_volume
  end
end
