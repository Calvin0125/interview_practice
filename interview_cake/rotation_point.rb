def find_rotation_point(words)

  # Find the rotation point in the array.
  first_word = words[0]
  floor = 0
  ceiling = words.length - 1
  
  while floor < ceiling
    middle_index1 = (floor + ceiling) / 2
    middle_index2 = middle_index1 + 1
    if words[middle_index2] < words[middle_index1]
      return middle_index2
    elsif words[middle_index2] > first_word
      floor = middle_index2
    elsif words[middle_index1] < first_word
      ceiling = middle_index1
    end
  end
  
  return 0
end


















# Tests

def run_tests
  desc = 'small array'
  actual = find_rotation_point(['cape', 'cake'])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_rotation_point(['grape', 'orange', 'plum', 'radish', 'apple'])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'large array'
  actual = find_rotation_point(['ptolemaic', 'retrograde', 'supplant',
                                'undulate', 'xenoepist', 'asymptote',
                                'babka', 'banoffee', 'engender',
                                'karpatka', 'othellolagkage'])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'rotation point 0'
  actual = find_rotation_point(['apple', 'banana', 'carrot'])
  expected = 0
  assert_equal(actual, expected, desc)

  # Are we missing any edge cases?
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
