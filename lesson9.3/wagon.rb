# frozen_string_literal: true
require_relative 'vallidation'
require_relative 'accessor'

class Wagon
  #include Manufacturer
  include Validation
  extend Accessors
  @@nubmer_wagon = 0

  attr_reader :argument, :loading_volume, :number, :volume
  attr_writer :free_volume
  
  attr_accessor_with_history :a, :d
  strong_attr_accessor :b, String

  validate :number, :presence
  validate :free_volume, :presence

  def initialize(*argument)
    @number = @@nubmer_wagon
    @free_volume = @volume
    validate!
    @loading_volume = 0
    @@nubmer_wagon += 1
    @volume = argument
  end

  def loading_wagon
    @loading_volume
  end

  def free_volume_w
    @volume - @loading_volume
  end
end
