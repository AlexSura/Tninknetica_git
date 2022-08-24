# frozen_string_literal: true
  require_relative 'vallidation'
  require_relative 'accessor'

class Route
  include InstanceCounter
  include Validation
  attr_reader :stations, :first_station, :last_station
  
  validate :first_station, :presence
  validate :last_station, :presence
  validate :first_station, :type, Station
  validate :last_station, :type, Station 

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @stations = [first_station, last_station]
  end

  def add_station(station)
    stations.insert(-2, station)
    puts "К маршруту #{stations.first.name} - #{stations.last.name} добавлена станция #{station.name}"
  end

  def delete_station(station)
    if @stations.size > 2
      stations.delete(station)
      puts "из маршрута #{stations.first.name} #{stations.last.name} удалена станция: #{station.name}"
    else
      'в Маршруте должны быть минимум ө станции'
    end
  end

  def list_station
    stations.each_with_index { |station, index| puts "#{index} : станция #{station.name}" }
  end
end
