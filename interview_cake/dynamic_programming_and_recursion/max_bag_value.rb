def max_duffel_bag_value(cake_tuples, capacity)

  # Calculate the maximum value we can carry.
  values = []
  (0..capacity).each do |n|
    max = 0
    cake_tuples.each do |weight, value|
      if weight == 0 && value > 0
        return Float::INFINITY
      elsif weight <= n
        next if weight == 0
        remaining_capacity = n - weight
        remaining_capacity_value = values[remaining_capacity]
        max = [remaining_capacity_value + value, max].max
      end
    end
    
    values[n] = max
  end
  
  values[capacity]
end
















# Tests

def run_tests
  desc = 'one cake'
  actual = max_duffel_bag_value([[2, 1]], 9)
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'two cakes'
  actual = max_duffel_bag_value([[4, 4], [5, 5]], 9)
  expected = 9
  assert_equal(actual, expected, desc)

  desc = 'only take less valuable cake'
  actual = max_duffel_bag_value([[4, 4], [5, 5]], 12)
  expected = 12
  assert_equal(actual, expected, desc)

  desc = 'lots of cakes'
  actual = max_duffel_bag_value([[2, 3], [3, 6], [5, 1], [6, 1], [7, 1], [8, 1]], 7)
  expected = 12
  assert_equal(actual, expected, desc)

  desc = 'value to weight ratio is not optimal'
  actual = max_duffel_bag_value([[51, 52], [50, 50]], 100)
  expected = 100
  assert_equal(actual, expected, desc)

  desc = 'zero capacity'
  actual = max_duffel_bag_value([[1, 2]], 0)
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'cake with zero value and weight'
  actual = max_duffel_bag_value([[0, 0], [2, 1]], 7)
  expected = 3
  assert_equal(actual, expected, desc)

  desc = 'cake with non zero value and zero weight'
  actual = max_duffel_bag_value([[0, 5]], 5)
  expected = Float::INFINITY
  assert_equal(actual, expected, desc)
  
  desc = 'zero capacity but zero weight should still be infinity'
  actual = max_duffel_bag_value([[0, 5]], 0)
  expected = Float::INFINITY
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
