class WordCloudData {
  constructor(inputString) {
    this.wordsToCounts = new Map();
    this.populateWordsToCounts(inputString);
  }

  populateWordsToCounts(inputString) {

    let currentWord = '';
    inputString.split('').forEach(char => {
      if (this.wordChar(char)) {
        currentWord += char;
      } else if ((this.hyphen(char)) && currentWord.length > 0) {
        currentWord += char;
      } else {
        this.addWord(currentWord);
        currentWord = '';
      }
    });
    
    if (currentWord.length > 0) {
      this.addWord(currentWord)
    }

  }
  
  wordChar(char) {
    char = char.toLowerCase();
    return ((char.charCodeAt(0) >= 97 && char.charCodeAt(0) <= 122) ||
             char.charCodeAt(0) == 39);
  }
  
  hyphen(char) {
    return char.charCodeAt(0) == 45;
  }
  
  addWord(word) {
    if (word == '') {
      return false; 
    } else if (this.wordsToCounts.has(word)) {
      this.wordsToCounts.set(word, this.wordsToCounts.get(word) + 1);
    } else if (this.wordsToCounts.has(word.toLowerCase())) {
      this.wordsToCounts.set(word.toLowerCase(), this.wordsToCounts.get(word.toLowerCase) + 1);
    } else if (this.wordsToCounts.has(this.capitalize(word))) {
      this.wordsToCounts.set(word, this.wordsToCounts.get(this.capitalize(word)) + 1);
      this.wordsToCounts.delete(this.capitalize(word));
    } else {
      this.wordsToCounts.set(word, 1);
    }
  }
  
  capitalize(word) {
   return word.charAt(0).toUpperCase() + word.slice(1);
  }

}


















// Tests

// There are lots of valid solutions for this one. You
// might have to edit some of these tests if you made
// different design decisions in your solution.

let desc = 'simple sentence';
let actual = new WordCloudData('I like cake').wordsToCounts;
let expected = new Map([['I', 1], ['like', 1], ['cake', 1]]);
assert(isMapsEqual(actual, expected), desc);

desc = 'longer sentence';
actual = new WordCloudData('Chocolate cake for dinner and pound cake for dessert').wordsToCounts;
expected = new Map([['and', 1], ['pound', 1], ['for', 2], ['dessert', 1],
  ['Chocolate', 1], ['dinner', 1], ['cake', 2]]);
assert(isMapsEqual(actual, expected), desc);

desc = 'punctuation';
actual = new WordCloudData('Strawberry short cake? Yum!').wordsToCounts;
expected = new Map([['cake', 1], ['Strawberry', 1], ['short', 1], ['Yum', 1]]);
assert(isMapsEqual(actual, expected), desc);

desc = 'hyphenated Words';
actual = new WordCloudData('Dessert - mille-feuille cake').wordsToCounts;
expected = new Map([['cake', 1], ['Dessert', 1], ['mille-feuille', 1]]);
assert(isMapsEqual(actual, expected), desc);

desc = 'ellipses between words';
actual = new WordCloudData('Mmm...mmm...decisions...decisions').wordsToCounts;
expected = new Map([['mmm', 2], ['decisions', 2]]);
assert(isMapsEqual(actual, expected), desc);

desc = 'apostrophes';
actual = new WordCloudData("Allie's Bakery: Sasha's Cakes").wordsToCounts;
expected = new Map([['Bakery', 1], ['Cakes', 1], ["Allie's", 1], ["Sasha's", 1]]);
assert(isMapsEqual(actual, expected), desc);

function isMapsEqual(map1, map2) {
  if (map1.size !== map2.size) {
    return false;
  }
  for (let [key, val] of map1) {
    const testVal = map2.get(key);

    // In cases of an undefined value, make sure the key
    // actually exists on the object so there are no false positives
    if (testVal !== val || (testVal === undefined && !map2.has(key))) {
      return false;
    }
  }
  return true;
}

function assert(condition, desc) {
  if (condition) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL`);
  }
}
