# frozen_string_literal: true

class Wagon
  include Manufacturer
  @@nubmer_wagon = 0

  attr_reader :argument, :loading_volume, :free_volume, :number, :volume

  def initialize(argument)
    @number = @@nubmer_wagon
    @loading_volume = 0
    @@nubmer_wagon += 1
    @volume = argument
    @free_volume = @volume
  end

  def loading_wagon
    @loading_volume
  end

  def free_volume_w
    @volume - @loading_volume
  end
end
