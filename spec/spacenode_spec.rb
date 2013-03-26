require 'rspec'
require '../lib/spacenode.rb'
require '../lib/board.rb'
describe SpaceNode do

  subject(:space) do
    pos = [0,0]
    SpaceNode.new(pos,d_board)
  end

  let(:d_board) {Board.new}

  its(:piece) {should == nil}
  its(:neighbors) {should == []}
  # its(:board) {should == d_board}

  describe "#has_piece?" do
    it "returns true if it has a piece" do
      d_piece = double("piece")
      space.position = d_piece
      space.should have_piece
    end
  end
  describe "#neighbors" do
    it "has three neighbors in the corner position" do
      d_board.spaces[0][0]
      .neighbors
      .count
      .should == 3
    end
    it "has 8 neighbors in the middle position" do
      d_board.spaces[1][1]
      .neighbors
      .count
      .should == 8
    end
    it "has 5 neighbors in the side position" do
      d_board.spaces[1][0]
      .neighbors
      .count
      .should == 5
    end
  end

end