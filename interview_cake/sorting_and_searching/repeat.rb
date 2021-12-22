def find_repeat(numbers)
  min = 1
  max = numbers.length - 1
  
  until min == max 
    middle = (min + max) / 2
    lower_range_length = middle - min + 1
    count_in_lower_range = numbers.count { |n| (min..middle).include?(n) }
    if count_in_lower_range > lower_range_length
      max = middle
    else
      min = middle + 1
    end
  end
  
  min
end


















# Tests

def run_tests
  desc = 'just the repeated number'
  actual = find_repeat([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_repeat([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_repeat([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_repeat([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
  
  desc = 'doesnt work'
  actual = find_repeat([1, 2, 3, 3, 4, 5])
  expected = 3
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
