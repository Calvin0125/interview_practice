function reverseWords(message) {

  // Decode the message by reversing the words
 message = reverseChars(message, 0, message.length - 1);
 
 word_start = 0;
 for ( let i = 0; i <= message.length; i++ ) {
   if ((message[i] == ' ') || (i == message.length)) {
     reverseChars(message, word_start, i - 1);
     word_start = i + 1;
   }
 }
}

function reverseChars(string, start_index, end_index) {
  while (end_index > start_index) {
    placeholder = string[end_index];
    string[end_index] = string[start_index];
    string[start_index] = placeholder;
    start_index += 1;
    end_index -= 1;
  }
  
  return string;
}
















// Tests

let desc = 'one word';
let input = 'vault'.split('');
reverseWords(input);
let actual = input.join('');
let expected = 'vault';
assertEqual(actual, expected, desc);

desc = 'two words';
input = 'thief cake'.split('');
reverseWords(input);
actual = input.join('');
expected = 'cake thief';
assertEqual(actual, expected, desc);

desc = 'three words';
input = 'one another get'.split('');
reverseWords(input);
actual = input.join('');
expected = 'get another one';
assertEqual(actual, expected, desc);

desc = 'multiple words same length';
input = 'rat the ate cat the'.split('');
reverseWords(input);
actual = input.join('');
expected = 'the cat ate the rat';
assertEqual(actual, expected, desc);

desc = 'multiple words different lengths';
input = 'yummy is cake bundt chocolate'.split('');
reverseWords(input);
actual = input.join('');
expected = 'chocolate bundt cake is yummy';
assertEqual(actual, expected, desc);

desc = 'empty string';
input = ''.split('');
reverseWords(input);
actual = input.join('');
expected = '';
assertEqual(actual, expected, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}
