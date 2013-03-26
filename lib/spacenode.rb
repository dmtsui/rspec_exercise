require 'debugger'

class SpaceNode
  attr_accessor :position, :piece, :neighbors, :board

  def initialize(position, board)
    @position = position
    @neighbors = []
    @board = board
  end

  def has_piece?
    !@piece.nil?
  end

	def add_neighbors
		pr, pc = @position
		move_directions = [[1,-1],[1,0],[1,1],[0,-1],
                       [0,1],[-1,-1],[-1,0],[-1,1]]
		move_directions.each do |r,c|
			@neighbors << @board.spaces[pr+r][pc+c] if inbounds?([pr+r,pc+c])
		  nil
    end
	end
  def inbounds?(position)
    position.all? {|coord|(0..7).include?(coord)}
  end

  def to_s
    "SpaceNode#{@position}"
  end
end