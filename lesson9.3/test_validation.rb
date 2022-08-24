require_relative 'wagon'
require_relative 'train'
require_relative 'station'
require_relative 'route'

#t = Wagon.new('123')


Train.new ('65454')



begin
  Wagon.new(10)
rescue ArgumentError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end



tr = Train.new('12312')
print tr
begin
  Train.new('0001034')
rescue ArgumentError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end



Station.new('s1')
Station.new('s2')

begin
  Route.new('not_station1', 'not_station2')
rescue TypeError => e
  puts "Get exception - #{e.message}"
  puts "\n"
end
