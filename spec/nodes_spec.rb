require 'rspec'
require '../lib/nodes.rb'

describe BinaryNodeTree do
  subject(:tree_node) { BinaryNodeTree.new() }

  its(:value) { should == nil }
  its(:parent) { should == nil }
  its(:left_child) { should == nil }
  its(:right_child) { should == nil }

  let(:tree_node) do
    n1 = BinaryNodeTree.new(1)
    n2 = BinaryNodeTree.new(2)
    n3 = BinaryNodeTree.new(3)
    n4 = BinaryNodeTree.new(4)
    n5 = BinaryNodeTree.new(5)
    n6 = BinaryNodeTree.new(6)
    n7 = BinaryNodeTree.new(7)
    n8 = BinaryNodeTree.new(8)
    n9 = BinaryNodeTree.new(9)
    n1.left_child = n2
    n1.right_child = n5
    n2.left_child = n3
    n3.left_child = n4
    n5.left_child = n6
    n5.right_child = n9
    n6.left_child = n7
    n6.right_child = n8
    n1
  end

  describe "#dfs" do
    it "searches through tree depth first" do
      [tree_node, tree_node.left_child, tree_node.left_child.left_child,
        tree_node.left_child.left_child.left_child,
        tree_node.right_child,tree_node.right_child.left_child
      ].each do |node|
        node.should_receive(:value).ordered
      end
      tree_node.dfs(5)
    end
  end

  describe "#bfs" do
    it "searches through tree level first" do
      [tree_node, tree_node.left_child, tree_node.right_child,
        tree_node.left_child.left_child, tree_node.right_child.left_child,
        tree_node.right_child.right_child
      ].each do |node|
        node.should_receive(:value).ordered
      end
      tree_node.bfs(9)
    end
  end


end