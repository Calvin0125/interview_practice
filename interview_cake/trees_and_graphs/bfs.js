import { root } from './binary_tree.js'

function bfs(node, func) {
  let queue = [node];

  while (queue.length > 0) {
    let currentNode = queue.shift();
    func(currentNode.value);
    if (currentNode.left != null) {
      queue.push(currentNode.left);
    }
    if (currentNode.right != null) {
      queue.push(currentNode.right);
    }
  }
}

bfs(root, value => console.log(value));
