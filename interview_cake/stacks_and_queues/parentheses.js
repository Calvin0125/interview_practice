function getClosingParen(sentence, index) {

  // Find the position of the matching closing parenthesis
  if (sentence[index] !== '(') {
    throw "The index must point to an opening parenthese!"
  } 
  
  let openCount = 0;
  
  for (let i = index + 1; i < sentence.length; i++) {
    let char = sentence[i];
    
    if (char == '(') {
      openCount += 1;
    } else if (char == ')' && openCount == 0) {
      return i;
    } else if (char == ')') {
      openCount -= 1;
    }
  }

  throw "There is no closing parenthese!"
}


















// Tests

let desc = 'all openers then closers';
let actual = getClosingParen('((((()))))', 2);
let expected = 7;
assertEqual(actual, expected, desc);

desc = 'mixed openers and closers';
actual = getClosingParen('()()((()()))', 5);
expected = 10;
assertEqual(actual, expected, desc);

desc = 'no matching closer';
const noCloser = () => (getClosingParen('()(()', 2));
assertThrowsError(noCloser, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
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
