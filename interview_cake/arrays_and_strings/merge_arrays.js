function mergeArrays(array1, array2) {

  // Combine the sorted arrays into one large sorted array
  array1Index = 0;
  array2Index = 0;
  mergedArray = [];
  
  while ((array1Index < array1.length) && (array2Index < array2.length)) {
    if (array1[array1Index] < array2[array2Index]) {
      mergedArray.push(array1[array1Index]);
      array1Index += 1;
    } else {
      mergedArray.push(array2[array2Index]);
      array2Index += 1;
    }
  }
  
  if (array1Index < array1.length) {
    mergedArray = mergedArray.concat(array1.slice(array1Index));
  } else {
    mergedArray = mergedArray.concat(array2.slice(array2Index));
  }

  return mergedArray;
}


















// Tests

let desc = 'both arrays are empty';
let actual = mergeArrays([], []);
let expected = [];
assertDeepEqual(actual, expected, desc);

desc = 'first array is empty';
actual = mergeArrays([], [1, 2, 3]);
expected = [1, 2, 3];
assertDeepEqual(actual, expected, desc);

desc = 'second array is empty';
actual = mergeArrays([5, 6, 7], []);
expected = [5, 6, 7];
assertDeepEqual(actual, expected, desc);

desc = 'both arrays have some numbers';
actual = mergeArrays([2, 4, 6], [1, 3, 7]);
expected = [1, 2, 3, 4, 6, 7];
assertDeepEqual(actual, expected, desc);

desc = 'arrays are different lengths';
actual = mergeArrays([2, 4, 6, 8], [1, 7]);
expected = [1, 2, 4, 6, 7, 8];
assertDeepEqual(actual, expected, desc);

function assertDeepEqual(a, b, desc) {
  const aStr = JSON.stringify(a);
  const bStr = JSON.stringify(b);
  if (aStr !== bStr) {
    console.log(`${desc} ... FAIL: ${aStr} != ${bStr}`);
  } else {
    console.log(`${desc} ... PASS`);
  }
}
