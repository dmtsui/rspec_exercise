require_relative './spacenode.rb'
require_relative './piece.rb'
require 'debugger'

class Board
	attr_accessor :spaces, :pieces

	def initialize
		@spaces = Array.new(8) {Array.new(8)}
    @pieces = []
		generate_spaces
    set_piece(:white,[3,3])
    set_piece(:black,[3,4])
    set_piece(:white,[4,4])
    set_piece(:black,[4,3])
		true
	end

	def generate_spaces
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

  def get_all_pieces(color)
    your_pieces = @pieces.select {|piece| piece.color == color}
    your_pieces
  end

  def move(color,position)
    p "move #{position}"

    valid_moves = get_valid_moves(color)
    p "valid moves #{valid_moves}"
    if valid_moves.keys.include?(position)
      p "valid move!"
      set_piece(color, position)
      flip_pieces(valid_moves[position])
    else
      "Not a Valid Move"
    end
  end

  def flip_pieces(pieces)
    pieces.each {|piece| piece.flip}
  end

  def get_valid_moves(color)
    valid_moves = {} # {[3,3] => [[2,3],[4,6]]}
    pieces = get_all_pieces(color)
    while pieces.count > 0
      piece = pieces.pop
      get_directions(piece).each do |dir|
        move = direction(piece , dir)
        valid_moves.merge!(move) unless move.nil?
      end
    end
    valid_moves
  end

  def get_directions(piece)
    pr, pc = piece.position
    move_directions = [[1,-1],[1,0],[1,1],[0,-1],
                     [0,1],[-1,-1],[-1,0],[-1,1]]
    moves = move_directions.select do |r,c|
       [r,c] if inbounds?([pr+r,pc+c])
    end
    moves
  end

  def direction(start, direction)
    row, col = start.position
    dr, dc = direction
    flip_pieces = []
    return nil if !inbounds?([row+dr,col+dc]) or !@spaces[row+dr][col+dc].has_piece?

    while inbounds?([row+dr,col+dc])
      row += dr ; col += dc
      if @spaces[row][col].has_piece?
        return nil if @spaces[row][col].piece.color == start.color
        flip_pieces << @spaces[row][col].piece
      else
        return {[row,col] => flip_pieces}
      end
    end
  end


  def inbounds?(position)
    position.all? {|coord|(0..7).include?(coord)}
  end

  def set_piece(color, position)
    #debugger
    row, col = position
    @pieces << Piece.new(color, @spaces[row][col])
    @spaces[row][col].piece = @pieces[-1]
  end

  def to_s
    "BoardObject"
  end
end
