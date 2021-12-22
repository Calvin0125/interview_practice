def find_duplicate(array)

  # Find a number that appears more than once... in O(n) time.
  index_in_cycle = get_index_in_cycle(array)
  cycle_length = get_cycle_length(array, index_in_cycle)
  stick_start = array[-1]
  stick_end = get_stick_end(array, cycle_length)
  
  until stick_start == stick_end
    stick_start = array[stick_start - 1]
    stick_end = array[stick_end - 1]
  end
  stick_start
end

def get_index_in_cycle(array)
  counter = 1
  node_value = array[-1]
  until counter == array.length
    node_value = array[node_value - 1]
    counter += 1
  end
  node_value - 1
end

def get_cycle_length(array, index_in_cycle)
  original_position_value = array[index_in_cycle]
  counter = 1
  node_value = array[original_position_value - 1]
  until node_value == original_position_value
    node_value = array[node_value - 1]
    counter += 1
  end
  counter
end

def get_stick_end(array, cycle_length)
  node_value = array[-1]
  (cycle_length).times do
    node_value = array[node_value - 1]
  end
  node_value
end
  















# Tests

def run_tests
  desc = 'just the repeated number'
  actual = find_duplicate([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_duplicate([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_duplicate([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_duplicate([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
