require 'spacenode.rb'
require 'debugger'
class Board
	attr_accessor :spaces, :pieces

	def initialize
		@spaces = Array.new(8) {Array.new(8)}
    @pieces = []
		generate_spaces
		true
	end

	def generate_spaces
    #cdebugger
		8.times do |row|
			8.times do |col|
				@spaces[row][col] = SpaceNode.new([row,col],self)
			end
		end
		8.times do |row|
			8.times do |col|
				@spaces[row][col].add_neighbors
			end
		end
	end

  def set_piece(color, position)

  end
end
