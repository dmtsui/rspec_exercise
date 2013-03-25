require 'debugger'
class Array
  def my_uniq
    results = []

    self.each do |num|
      results << num unless results.include?(num)
    end
    results
  end

  def two_sums
    pairs = []
    #[1,2,3,4,5]
    #p self
    length = self.length - 1
    (0...length).each do |i|
      (i+1..length).each  do |j|
        pairs << [i, j] if self[i]+self[j] == 0
      end
    end

    pairs
  end

  def my_transpose
    trans_arr = []

    (0...self.length).each do |col|
      row_arr = []
      (0...self.length).each do |row|
        row_arr << self[row][col]
      end
      trans_arr << row_arr
    end

    trans_arr
  end

  def stock_picker
    best_pair = []
    # buy = nil
    # sell = nil
    profit = 0
    length = self.length - 1
    (0...length).each do |buy|
      (buy + 1..length).each  do |sell|
        if self[sell] - self[buy] > profit
          best_pair = [buy, sell]
          profit = self[sell] - self[buy]
        end
      end
    end

    best_pair
  end
end



