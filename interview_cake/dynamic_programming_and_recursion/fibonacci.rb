def fib(n)

  # Compute the nth Fibonacci number.
  if n < 0
   raise ArgumentError, "There can't be a negative fibonacci number."
  elsif n <= 1
    return n
  end
  
  sum = 1
  last_number = 1
  (n - 2).times do 
    sum = sum + last_number
    last_number = sum - last_number
  end
  
  sum
end


















# Tests

def run_tests
  desc = 'zeroth fibonacci'
  actual = fib(0)
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'first fibonacci'
  actual = fib(1)
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'second fibonacci'
  actual = fib(2)
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'third fibonacci'
  actual = fib(3)
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'fifth fibonacci'
  actual = fib(5)
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'tenth fibonacci'
  actual = fib(10)
  expected = 55
  assert_equal(actual, expected, desc)

  desc = 'negative fibonacci'
  assert_raises(desc) { fib(-1) }
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
