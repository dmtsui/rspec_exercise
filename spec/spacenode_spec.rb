require 'rspec'
require '../lib/spacenode.rb'

describe SpaceNode do
  subject(:space) {SpaceNode.new([0,0])}
  its(:piece) {should == nil}

  describe "#piece=" do
    let(:black_piece) do
       piece = double("piece")
       piece.stub(:color) {:black}

       piece
     end
    it "sets a piece on the space if empty" do
      space.should_receive(black_piece)
      space.piece = black_piece
      #space.should_receive(:piece)
      space.piece.color.should == black_piece.color
    end
  end
  # describe "#flip_piece?" do
  #   context "default piece" do
  #
  #   end
  #   it "flips the piece color" do
  #
  #   end
  # end
end