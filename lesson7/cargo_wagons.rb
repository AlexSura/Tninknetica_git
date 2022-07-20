# frozen_string_literal: true

class CargoWagons < Wagon
  def loading(loading_volume)
    if volume > loading_volume
      puts 'вагон заполнен'
      @loading_volume = loading_volume
    else
      puts 'разделите на два вагона'
    end
  end
end
