function isValid(code) {

  // Determine if the input code is valid
  let enclosureStack = [];
  
  for (let i = 0; i < code.length; i++) {
    let char = code[i];
    
    if (isOpener(char)) {
      enclosureStack.push(char);
    } else if (isCloser(char)) {
      let opener = enclosureStack.pop();
      if (!enclosuresMatch(opener, char)) {
        return false;
      }
    }
  }

  return enclosureStack.length == 0;
}

function isOpener(char) {
  return char === '(' ||
         char === '[' ||
         char === '{';
}

function isCloser(char) {
  return char === ')' ||
         char === ']' ||
         char === '}';
}

function enclosuresMatch(opener, closer) {
  return (opener === '(' && closer === ')') ||
         (opener === '[' && closer === ']') ||
         (opener === '{' && closer === '}');
}


















// Tests

let desc = 'valid short code';
assertEqual(isValid('()'), true, desc);

desc = 'valid longer code';
assertEqual(isValid('([]{[]})[]{{}()}'), true, desc);

desc = 'mismatched opener and closer';
assertEqual(isValid('([][]}'), false, desc);

desc = 'missing closer';
assertEqual(isValid('[[]()'), false, desc);

desc = 'extra closer';
assertEqual(isValid('[[]]())'), false, desc);

desc = 'empty string';
assertEqual(isValid(''), true, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
