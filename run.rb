require './lib/nnd'
puts "First number:"
first = gets.chomp
puts "Second number:"
second = gets.chomp
nnd = Nnd.new(first, second)
nnd.output_answer
