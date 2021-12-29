class MaxStack

  # Implement the push, pop, and get_max methods.
  def initialize
    @items = []
    @max_stack = []
  end

  def push(item)
    @items << item
    if !get_max || get_max < item
      @max_stack << item
    else
      @max_stack << get_max
    end
  end

  def pop
    if @items.empty?
      nil
    else
      @max_stack.pop
      @items.pop
    end
  end

  def get_max
    if @max_stack.empty?
      nil
    else
      @max_stack[-1]
    end
  end
end


















# Tests

def run_tests
  desc = 'stack usage'
  max_stack = MaxStack.new

  max_stack.push(5)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)

  max_stack.push(4)
  max_stack.push(7)
  max_stack.push(7)
  max_stack.push(8)

  actual = max_stack.get_max
  expected = 8
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 8
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 7
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)

  actual = max_stack.pop
  expected = 4
  assert_equal(actual, expected, desc)

  actual = max_stack.get_max
  expected = 5
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
