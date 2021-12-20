def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(array)

  # Shuffle the input in place.
  ceiling = array.length - 1
  0.upto(array.length - 2) do |i|
    floor = i
    random = get_random(floor, ceiling)
    if random != i
      array[i], array[random] = array[random], array[i]
    end
  end

  array
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
shuffle(sample_array)
puts sample_array.inspect
