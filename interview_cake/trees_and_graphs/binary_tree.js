class TreeNode {
  constructor(value) {
    this.value = value;
    this.right = null;
    this.left = null;
  }
}

export let root = new TreeNode(1);
root.left = new TreeNode(2);
root.left.left = new TreeNode(3);
root.left.right = new TreeNode(4);
root.right = new TreeNode(5);
root.right.left = new TreeNode(6);
root.right.right = new TreeNode(7);
root.right.right.right = new TreeNode(8);
root.right.right.right.right = new TreeNode(9);
root.right.right.right.rightleft = new TreeNode(10);

