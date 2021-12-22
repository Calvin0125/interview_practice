function findDuplicate(array) {

  // Find a number that appears more than once ... in O(n) time
  let indexInCycle = getIndexInCycle(array);
  let cycleLength = getCycleLength(array, indexInCycle);
  let stickStart = array[array.length - 1]
  let stickEnd = getStickEnd(array, cycleLength);
  
  while (stickStart != stickEnd) {
    stickStart = array[stickStart - 1];
    stickEnd = array[stickEnd - 1];
  }

  return stickEnd;
}

function getIndexInCycle(array) {
  let nodeValue = array[array.length - 1];
  let counter = 1;
  while (counter < array.length) {
    nodeValue = array[nodeValue - 1];
    counter += 1;
  }
  
  return nodeValue - 1;
}

function getCycleLength(array, indexInCycle) {
  let originalPositionValue = array[indexInCycle];
  let nodeValue = array[originalPositionValue - 1];
  let counter = 1;
  while (nodeValue != originalPositionValue) {
    nodeValue = array[nodeValue - 1];
    counter += 1;
  }
  
  return counter;
}

function getStickEnd(array, cycleLength) {
  let nodeValue = array[array.length - 1];
  for (let i = 0; i < cycleLength; i++) {
    nodeValue = array[nodeValue - 1];
  }
  
  return nodeValue;
}


















// Tests

let desc = 'just the repeated number';
let actual = findDuplicate([1, 1]);
let expected = 1;
assertEqual(actual, expected, desc);

desc = 'short array';
actual = findDuplicate([1, 2, 3, 2]);
expected = 2;
assertEqual(actual, expected, desc);

desc = 'medium array';
actual = findDuplicate([1, 2, 5, 5, 5, 5]);
expected = 5;
assertEqual(actual, expected, desc);

desc = 'long array';
actual = findDuplicate([4, 1, 4, 8, 3, 2, 7, 6, 5]);
expected = 4;
assertEqual(actual, expected, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
