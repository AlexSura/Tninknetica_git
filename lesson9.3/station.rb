# frozen_string_literal: true
  require_relative 'manufacturer'
  require_relative 'instance_counter'
  require_relative 'vallidation'
  require_relative 'accessor'

class Station
  include InstanceCounter
  include Validation
  include Accessors
  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String 
  
  @@stations = []

  def initialize(name)
    @name = name.chomp.to_s
    validate!
    @trains = []
    @trains_pas = []
    @trains_gruz = []
    @@stations << self
  end

  def self.all
    @@stations
  end

  def train_reception(train)
    trains << train
  end

  def list_trains_types(type)
    trains.select { |item| item.type == type }
  end

  def train_dispatch(train)
    @trains.delete(train)
    puts "со станции #{name} отправился поезд #{train.number}"
  end

  def list_trains
    trains.each { |train| puts "на станции #{@name} поезд #{train.number}" }
  end

  def format_list_train(&block)
    @trains.each { |train| block.call(train) }
  end
  # написать метод, который принимает блок и проходит по всем поездам на станции,
  # передавая каждый поезд в блок.
end
