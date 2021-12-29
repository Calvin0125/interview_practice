require 'byebug'
def change_possibilities(amount, denominations)

  # Calculate the number of ways to make change.
  answer = 0
  denominations.each do |denomination|
    multiplier = 2
    other_denominations = denominations.dup
    other_denominations.delete(denomination)
    until denomination > amount
      amount_remaining = amount - denomination
      byebug
      answer += change_possibilities(amount_remaining, other_denominations)
      denomination *= multiplier
      multiplier += 1
    end
  end
  answer
end


















# Tests

def run_tests
  actual = change_possibilities(4, [1, 2, 3])
  expected = 4
  assert_equal(actual, expected, 'sample input')

  actual = change_possibilities(0, [1, 2])
  expected = 1
  assert_equal(actual, expected, 'one way to make zero cents')

  actual = change_possibilities(1, [])
  expected = 0
  assert_equal(actual, expected, 'no ways if no coins')

  actual = change_possibilities(5, [25, 50])
  expected = 0
  assert_equal(actual, expected, 'big coin value')

  actual = change_possibilities(50, [5, 10])
  expected = 6
  assert_equal(actual, expected, 'big target amount')

  actual = change_possibilities(100, [1, 5, 10, 25, 50])
  expected = 292
  assert_equal(actual, expected, 'change for one dollar')
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
