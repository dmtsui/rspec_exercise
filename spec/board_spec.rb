require 'rspec'
require '../lib/board.rb'

describe Board do
  subject(:board) { Board.new}

  describe "set_piece" do
    it "places a piece on the board" do
      board.set_piece(:B,[3,4])
      board.spaces[3][4].has_piece?.should be_true
    end
  end

  # let(:piece) {Piece.new(:B, board.spaces[3][4])}
  # describe "#get_valid_moves" do
  #   it "gets all the valid moves for a piece" do
  #     piece.get_valid_moves.should == [[3, 2], [2, 3], [5, 4], [4, 5]]
  #   end
  # end
end