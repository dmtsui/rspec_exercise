class Hanoi
  attr_accessor :piles, :num_discs

  def initialize(num_discs)
    @num_discs = num_discs
    @piles = Array.new(3) { Array.new }
    @piles[0] = (1..num_discs).to_a
  end


  def valid_move?(input)

    unless @piles[input[0]].empty? or input[0] == input[1]
      unless @piles[input[1]].empty?
        return @piles[input[0]][0] < @piles[input[1]][0] ?  true : false
      else
        return true
      end
    else
      false
    end
  end

  def win?
    true if @piles[1].length == num_discs or @piles[2].length == num_discs
  end
end