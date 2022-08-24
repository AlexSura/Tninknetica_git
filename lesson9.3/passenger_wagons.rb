# frozen_string_literal: true

class PassengerWagons < Wagon
  def loading
    @loading_volume += 1
  end
end
