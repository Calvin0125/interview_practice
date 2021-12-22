function reconstructPath(node, howWeGotToNodes) {
  let path = [];
  while (node) {
    path.push(node);
    node = howWeGotToNodes[node];
  }
  return path.reverse();
}

function getPath(graph, startNode, endNode) {

  // Find the shortest route in the network between the two users
  if (!graph[startNode] || !graph[endNode]) {
    throw "The graph must include the start and end node.";
  }
  
  let queue = [startNode];
  let howWeGotToNodes = {};
  howWeGotToNodes[startNode] = null;
  
  while (queue.length > 0) {
    let node = queue.shift();
    if (node == endNode) {
      return reconstructPath(node, howWeGotToNodes); 
    }
    
    graph[node].forEach(neighbor => {
      if (howWeGotToNodes[neighbor] === undefined) {
        howWeGotToNodes[neighbor] = node;
        queue.push(neighbor);
      }
    });
  }
  return null;
}


















// Tests
const graph = {
  'a': ['b', 'c', 'd'],
  'b': ['a', 'd'],
  'c': ['a', 'e'],
  'd': ['a', 'b'],
  'e': ['c'],
  'f': ['g'],
  'g': ['f']
};

let desc = 'two hop path 1';
let actual = getPath(graph, 'a', 'e');
let expected = ['a', 'c', 'e'];
assertDeepEqual(actual, expected, desc);

desc = 'two hop path 2';
actual = getPath(graph, 'd', 'c');
expected = ['d', 'a', 'c'];
assertDeepEqual(actual, expected, desc);

desc = 'one hop path 1';
actual = getPath(graph, 'a', 'c');
expected = ['a', 'c'];
assertDeepEqual(actual, expected, desc);

desc = 'one hop path 2';
actual = getPath(graph, 'f', 'g');
expected = ['f', 'g'];
assertDeepEqual(actual, expected, desc);

desc = 'one hop path 3';
actual = getPath(graph, 'g', 'f');
expected = ['g', 'f'];
assertDeepEqual(actual, expected, desc);

desc = 'zero hop path';
actual = getPath(graph, 'a', 'a');
expected = ['a'];
assertDeepEqual(actual, expected, desc);

desc = 'no path';
actual = getPath(graph, 'a', 'f');
expected = null;
assertDeepEqual(actual, expected, desc);

desc = 'start node not present';
assertThrowsError(() => {
  getPath(graph, 'h', 'a');
}, desc);

desc = 'end node not present';
assertThrowsError(() => {
  getPath(graph, 'a', 'h');
}, desc);

function assertDeepEqual(a, b, desc) {
  const aStr = JSON.stringify(a);
  const bStr = JSON.stringify(b);
  if (aStr !== bStr) {
    console.log(`${desc} ... FAIL: ${aStr} != ${bStr}`);
  } else {
    console.log(`${desc} ... PASS`);
  }
}

function assertThrowsError(func, desc) {
  try {
    func();
    console.log(`${desc} ... FAIL`);
  } catch (e) {
    console.log(`${desc} ... PASS`);
  }
}
