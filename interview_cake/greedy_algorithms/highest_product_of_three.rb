def highest_product_of_3(array_of_ints)

  # Calculate the highest product of three numbers.
  if array_of_ints.length < 3
    raise ArgumentError, 'The array must contain at least 3 integers'
  end
  
  highest = array_of_ints[0..1].max
  lowest = array_of_ints[0..1].min
  highest_product_of_two = array_of_ints[0] * array_of_ints[1]
  lowest_product_of_two = array_of_ints[0] * array_of_ints[1]
  highest_product_of_three = array_of_ints.slice(0..2).reduce(:*)
  
  array_of_ints.slice(2..-1).each do |n|
    if highest_product_of_two * n > highest_product_of_three
      highest_product_of_three = highest_product_of_two * n
    elsif lowest_product_of_two * n > highest_product_of_three
      highest_product_of_three = lowest_product_of_two * n
    end
    
    if n * highest > highest_product_of_two
      highest_product_of_two = n * highest
    elsif n * lowest > highest_product_of_two
      highest_product_of_two = n * lowest
    end
    
    if n * lowest < lowest_product_of_two
      lowest_product_of_two = n * lowest
    elsif n * highest < lowest_product_of_two
      lowest_product_of_two = n * highest
    end
    
    lowest = n if n < lowest
    highest = n if n > highest
  end
  
  highest_product_of_three
end
















# Tests

def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests
