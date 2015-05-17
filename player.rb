#class to define Player
class Player
  attr_accessor :name, :location
	
  def initialize
    puts  "Enter your name:\n"
    @name = gets
  end
  
end