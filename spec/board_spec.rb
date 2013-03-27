require 'rspec'
require 'board'
require 'piece'

describe Board do
  subject(:board) { Board.new }

  its('pieces.count'){should == 4}

  describe "set_piece" do
    it "places a piece on the board" do
      board.spaces[3][4].has_piece?.should be_true
    end
  end

  describe "#get_valid_moves" do
    it "gets all the valid moves for a piece" do
      board.get_valid_moves(:black).keys.should include([3, 2], [2, 3],[5, 4], [4, 5])
    end
  end

  describe "#flip_pieces" do
    let(:space_node) {double("SpaceNode")}
    let(:pieces) do
      [Piece.new(:white,space_node), Piece.new(:white,space_node),
       Piece.new(:white,space_node)]
    end

    it "flips a piece to opposite color" do
      board.flip_pieces(pieces)
      pieces.each do |piece|
        piece.color.should == :black
      end
    end


  end

end