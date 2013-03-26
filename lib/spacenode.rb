require 'debugger'

class SpaceNode
  attr_accessor :position, :neighbors, :board, :piece

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
			@neighbors << @board.spaces[pr+r][pc+c] if [pr+r,pc+c].all? {|coord|(0..7).include?(coord)}
		  nil
    end
	end
end