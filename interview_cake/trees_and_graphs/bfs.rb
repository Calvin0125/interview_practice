require_relative 'binary_tree'

def bfs(node)
  queue = [node]

  while queue.length != 0
    node = queue.shift
    queue.push(node.left) if node.left != nil
    queue.push(node.right) if node.right != nil
    yield node.value
  end
end

bfs(ROOT) { |value| puts value }
