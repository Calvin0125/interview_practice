require_relative 'binary_tree'
def dfs(node, &block)
  yield node.value

  dfs(node.left, &block) if node.left != nil
  dfs(node.right, &block) if node.right != nil
end

dfs(ROOT) { |value| puts value }
