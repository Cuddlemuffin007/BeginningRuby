require_relative 'room'
require_relative 'player'
require_relative 'item'

class Dungeon
  attr_accessor :player
  
  def initialize
    @player = Player.new
	@rooms = []
  end
  
  #add rooms to the dungeon
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  
  #assign starting location for the player and start the game
  def start(location)
    @player.location = location
	show_current_description
	get_direction
  end
  
  #displays the player's current room details
  def show_current_description
    current_room = find_room_in_dungeon(@player.location)
    current_room.full_description
	current_room.show_connections
  end
  
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference}
  end
  
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end
  
  def go(direction)
    puts "You go #{direction}"
	@player.location = find_room_in_direction(direction)
	show_current_description
  end
  
  def get_direction
    puts "Which way do you want to go?\n"
    direction = gets.strip.downcase.to_sym
	go(direction)
  end
end

#Create main dungeon instance
my_dungeon = Dungeon.new

#Add rooms
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {:west => :smallcave})
my_dungeon.add_room(:smallcave, "Small Cave", "a small claustrophobic cave", {:east => :largecave})

#starting location
my_dungeon.start(:largecave)