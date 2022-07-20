# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super
    puts " Пассажирский Поезд #{number} собран и готов к движению"
  end

  def add_wagon(wagon)
    if wagon.instance_of?(PassengerWagons)
      @wagons << wagon
    else
      puts 'данный вагон не является пассажирским'
    end
  end

  def deleted_wagon
    @wagons.delete_last
    puts "у поезда #{number} отцеплен вагон"
  end
end
