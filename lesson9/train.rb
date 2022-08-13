# frozen_string_literal: true
  require_relative 'manufacturer'
  require_relative 'instance_counter'
  require_relative 'vallidation'
  require_relative 'accessor'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_TRAIN_VALIDATE = /^[a-z0-9]{3}-*[a-z0-9]{2}$/.freeze

  attr_reader :number, :route, :wagons

  @@trains = {}

  validate :number, :presence
  validate :number, :format,  NUMBER_TRAIN_VALIDATE

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @route = nil
    @current_station = nil
    @@trains[number] = self
    validate!
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def format_list_wagon(&block)
    @wagons.each { |wagon| block.call(wagon) }
  end

  def stop
    @speed = 0
  end

  def take_route(route)
    @route = route
    @current_station = route.stations.first
    # puts "поезду #{number} присвоен маршрут #{route.stations.first.name} #{route.stations.last.name}"
    route.stations.first.train_reception(self)
  end

  def next_station
    if @current_station != route.stations.last
      # puts "следующая станция #{route.stations[self.indx + 1].name}"
      route.stations[indx + 1]
    else
      # puts "конечная станция #{route.stations.last.name}"
      route.stations.last
    end
  end

  def prev_station
    if @current_station != route.stations.first
      # puts "Предыдущая станция #{route.stations[self.indx - 1].name}"
      route.stations[indx - 1]
    else
      # puts "Стартовая станция маршрута #{route.stations.first.name}"
      route.stations.first
    end
  end

  def move_forward_station
    if @current_station.name != route.stations.last.name
      route.stations[indx].train_dispatch(self)
      @current_station = next_station
      @current_station.train_reception(self)
    else
      false
    end
  end

  def move_back_station
    if @current_station.name != route.stations.first.name
      nil
    else
      route.stations[indx].train_dispatch(self)
      @current_station = prev_station
      @current_station.train_reception(self)
    end
  end

  def indx
    route.stations.index(@current_station)
  end
end
