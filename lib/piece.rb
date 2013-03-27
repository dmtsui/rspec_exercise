class Piece
  attr_accessor :color, :space

  def initialize(color, space)
    @color = color
    @space = space
  end

  def position
    @space.position
  end

  def flip
    @color = (@color == :white) ? :black : :white
  end

  def to_s
    "Piece#{position}"
  end


end