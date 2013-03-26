class Piece
  attr_accessor :color

  def initialize(color, space)
    @color = color
    @space = space
  end

  def position
    @space.position
  end

  def flip
    @color = (@color == :W) ? :B : :W
  end


end