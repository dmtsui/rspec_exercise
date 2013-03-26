require 'rspec'
#require '../lib/board.rb'
require 'board'

describe Board do
  subject(:board) { Board.new }
  #board.should have(4).pieces

  its('pieces.count'){should == 4}

  describe "set_piece" do
    it "places a piece on the board" do
      board.spaces[3][4].has_piece?.should be_true
    end
  end

  describe "#get_valid_moves" do
    it "gets all the valid moves for a piece" do
      #pending
      board.get_valid_moves(:B).should == [[3, 2], [2, 3],[5, 4], [4, 5]]

    end
  end


end