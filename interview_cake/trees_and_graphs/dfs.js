import { root } from './binary_tree.js'

function dfs(node, func) {
  func(node.value);
  if (node.left != null) {
    dfs(node.left, func);
  }

  if (node.right != null) {
    dfs(node.right, func);
  }
}

dfs(root, value => console.log(value));
