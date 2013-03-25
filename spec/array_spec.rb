require 'rspec'
require '../lib/array.rb'

describe Array do

  subject(:array) { Array.new }


  describe "#my_uniq" do
    before do
      @array = [1, 2, 2, 3, 1]
    end

    it "removes duplicates from an array" do
      @array.my_uniq.should eq([1, 2, 3])
    end
  end

  describe "#two_sums" do
    before do
      @array = [1, 2, 2, 3,-1]
    end
    it "finds pairs that sums to zero" do
      @array.two_sums.should == [[0,4]]
    end
  end

  describe "#my_transpose" do
    before do
      @array = [
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ]
    end

    it "converts between row-orientation and col-orientation" do
      @array.my_transpose.should == [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    end
  end

  describe "#stock_picker" do
    before do
      @array = [1, 3, 5, 2, 4]
    end

    it "outputs the most profitable pair of days to buy and sell stock" do
      @array.stock_picker.should == [0, 2]
    end
  end

end