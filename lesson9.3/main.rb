# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validate'
require_relative 'manufacturer'
require_relative 'wagon'
require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagons'
require_relative 'cargo_wagons'
require_relative 'interface'
require_relative 'accessor'
require_relative 'vallidation'

IneterfaceMenu.new
Interface.new.call

