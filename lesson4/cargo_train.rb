
class CargoTrain < Train

  def initialize(number)
    super
    puts " Грузовой поезд #{number} собран и готов к движенмю "
  end

  def add_wagon(wagon)
    if wagon.instance_of?(CargoWagons)
      @wagons << wagon
    else
      "данный вагон не является грузовым"
    end
  end

  def deleted_wagon
    @wagons.delete_last
    puts "у поезда #{self.number} отцеплен вагон"
  end
end
