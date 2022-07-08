class Wagon
  include Manufacturer
  @@nubmer_wagon = 0
  def initialize(argument)
  @number = @@nubmer_wagon
  @@nubmer_wagon += 1
end
end
