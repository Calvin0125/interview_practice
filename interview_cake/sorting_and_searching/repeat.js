function findRepeat(numbers) {

  // Find a number that appears more than once
  let min = 1;
  let max = numbers.length - 1;
  
  while (max > min) {
    let middle = parseInt((min + max) / 2);
    let countInLowerRange = 0;
    let lowerRangeLength = middle - min + 1;
    numbers.forEach(number => {
      if (number >= min && number <= middle) {
        countInLowerRange += 1;
      }
    });
    
    if (countInLowerRange > lowerRangeLength) {
      max = middle;
    } else {
      min = middle + 1;
    }
  }
  
  return min;
}


















// Tests

let desc = 'just the repeated number';
let actual = findRepeat([1, 1]);
let expected = 1;
assertEqual(actual, expected, desc);

desc = 'short array';
actual = findRepeat([1, 2, 3, 2]);
expected = 2;
assertEqual(actual, expected, desc);

desc = 'medium array';
actual = findRepeat([1, 2, 5, 5, 5, 5]);
expected = 5;
assertEqual(actual, expected, desc);

desc = 'long array';
actual = findRepeat([4, 1, 4, 8, 3, 2, 7, 6, 5]);
expected = 4;
assertEqual(actual, expected, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
