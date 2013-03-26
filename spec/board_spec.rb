require 'rspec'
require '../lib/board.rb'

describe Board do
  subject(:board) { Board.new}

  its(:spaces) {length.should == 8}
  its(:spaces) do
    spaces.each do |row|
      row.count == 8
    end
  end
  its(:pieces.count) {should == 4}
end