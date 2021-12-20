class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end
end

ROOT = TreeNode.new(1)
ROOT.left = TreeNode.new(2)
ROOT.left.left = TreeNode.new(3)
ROOT.left.right = TreeNode.new(4)
ROOT.right = TreeNode.new(5)
ROOT.right.left = TreeNode.new(6)
ROOT.right.right = TreeNode.new(7)
