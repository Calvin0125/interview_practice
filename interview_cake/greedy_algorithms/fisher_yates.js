function getRandom(floor, ceiling) {
  return Math.floor(Math.random() * (ceiling - floor + 1)) + floor;
}

function shuffle(array) {

  // Shuffle the input in place
  let ceiling = array.length - 1;
  
  for (let i = 0; i < ceiling; i++) {
    let floor = i;
    random = getRandom(floor, ceiling)
    if (random != i) {
      [array[i], array[random]] = [array[random], array[i]];
    }
  }
}


const sample = [1, 2, 3, 4, 5];
console.log('Initial array: ', sample);
shuffle(sample);
console.log('Shuffled array: ', sample);
