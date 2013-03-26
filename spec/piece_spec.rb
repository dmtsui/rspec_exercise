require 'rspec'
require '../lib/piece.rb'
require '../lib/board.rb'

describe Piece do
  let(:board){Board.new}
  subject(:piece) {Piece.new(:W, board.spaces[3][3])}

  its(:position) {should == [3,3]}
  its(:color) {should == :W}

  describe "#flip" do
    it "flips to opposite color" do
      piece.flip
      piece.color.should == :B
    end
  end

end