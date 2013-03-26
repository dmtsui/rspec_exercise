class SpaceNode
  attr_accessor :position, :piece
  attr_reader :piece

  def initialize(position)
    @position = position
  end

  def piece=(p)
    if @piece.nil?
      @piece = p
    else
      raise "Not an empty space"
    end
  end


end