function findRotationPoint(words) {

  // Find the rotation point in the vector
  let firstWord = words[0];
  let floor = 0;
  let ceiling = words.length - 1;
  
  while (floor < ceiling) {
    middleIndex1 = parseInt((ceiling + floor) / 2);
    middleIndex2 = middleIndex1 + 1;
    
    if (words[middleIndex2] < words[middleIndex1]) {
      return middleIndex2;
    } else if (words[middleIndex2] >= firstWord) {
      floor = middleIndex2;
    } else if (words[middleIndex1] <= firstWord) {
      ceiling = middleIndex1;
    }
  }

  return 0;
}


















// Tests

let desc = 'small array';
let actual = findRotationPoint(['cape', 'cake']);
let expected = 1;
assertEquals(actual, expected, desc);

desc = 'medium array';
actual = findRotationPoint(['grape', 'orange', 'plum', 'radish', 'apple']);
expected = 4;
assertEquals(actual, expected, desc);

desc = 'large array';
actual = findRotationPoint(['ptolemaic', 'retrograde', 'supplant',
  'undulate', 'xenoepist', 'asymptote',
  'babka', 'banoffee', 'engender',
  'karpatka', 'othellolagkage']);
expected = 5;
assertEquals(actual, expected, desc);

desc = 'rotation point 0';
actual = findRotationPoint(['a', 'b', 'c']);
expected = 0;
assertEquals(actual, expected, desc);

function assertEquals(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
