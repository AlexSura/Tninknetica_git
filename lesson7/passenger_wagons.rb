class PassengerWagons < Wagon
 
 attr_reader :passager_seats, :take_place, :free_places, :number
  
  def initialize(passager_seats)
    super
    @passager_seats = passager_seats
    @take_place = 0
  end

  def take_place
    @take_place += 1
  end

  def occupied_place
    @take_place
  end

  def free_places
     free_places = self.passager_seats - self.occupied_place 
  end
end
