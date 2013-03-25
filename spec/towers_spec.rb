require 'rspec'
require '../lib/towers.rb'

describe Hanoi do
  subject(:hanoi) { Hanoi.new(3) }

  describe "#initialize" do
    it "has three piles" do
      hanoi.piles.length.should == 3
    end

    it "has all discs in the first pile" do
      hanoi.piles[0].should == [1, 2, 3]
    end
  end

  describe "#valid_move?" do
    let(:hanoi1) {double(Hanoi.new(3), :piles => [ [3], [1, 2], [] ])}

    it "validates move" do
      hanoi1.valid_move?([0,1]).should be_false
      hanoi1.valid_move?([1,2]).should be_true
    end

  end

  describe "#win?" do

    let(:hanoi1) {double(Hanoi.new(3), :piles => [ [], [1, 2, 3], [] ])}

    it "has all discs in either the second or third pile" do
      (hanoi1.piles[1].should == [1, 2, 3] or hanoi.piles[2].should == [1, 2, 3])
    end
  end
end
