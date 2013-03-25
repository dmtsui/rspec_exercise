class BinaryNodeTree
  attr_accessor :value, :parent
  attr_reader :left_child, :right_child

  def initialize(value = nil)
    @value = value
    @parent, @left_child, @right_child = nil, nil, nil
  end

  def left_child=(node)
    @left_child.parent = nil if @left_child
    @left_child = node
    @left_child.parent = self
  end

  def right_child=(node)
    @right_child.parent = nil if @right_child
    @right_child = node
    @right_child.parent = self
  end

  def dfs(target)
    return self if value == target
    [self.left_child, self.right_child].each do |child|
      next if child.nil?
      result = child.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)
    nodes = [self]
    until nodes.empty?
      node = nodes.shift
      return node if node.value == target
      [node.left_child, node.right_child].each do |child|
        nodes << child unless child.nil?
      end
    end
    nil
  end


end