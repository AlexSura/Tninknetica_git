class Wagon
  include Manufacturer
    @@nubmer_wagon = 0
    def initialize(argument)
    @number = @@nubmer_wagon
    @loading_volume = 0
    @@nubmer_wagon += 1
  end

  def loading_wagon
    @loading_volume
  end
end
