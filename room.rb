#class to define rooms of the dungeon
class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end
  #display room description
  def full_description
    puts "#{@name}\n\nYou are in #{@description}"
  end
  
  #display room connections
  def show_connections
    self.connections.each do |key, value|
	  puts "To the #{key} is a #{value}"
	end
  end
end