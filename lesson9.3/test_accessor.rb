require_relative 'wagon'

c = Wagon.new(123, 50)

c.a = 10
c.a = 15
c.a = 20
c.d = 140
c.d = -15

puts "c.a = #{c.a}, c.d = #{c.d}"
puts "c.a_history = #{c.a_history}, c.d_history = #{c.d_history}\n"

c.b = '12'
puts 'Check strong_attr_accessor'
begin
  c.b = 12
  puts 'correct type.'
rescue TypeError
  puts 'c.b = 12 - threw exception'
end
