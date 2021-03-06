class Stack
  def initialize
    @items = []
  end
  
  def push(item)
    @items << item
  end
  
  def pop
    if @items.empty?
      nil
    else
      @items.pop
    end
  end
  
  def peek
    @items[-1]
  end
end

class QueueTwoStacks

  # Implement the enqueue and dequeue methods.
  def initialize
    @in_stack = Stack.new
    @out_stack = Stack.new
  end

  def enqueue(item)
    @in_stack.push(item)
  end

  def dequeue
    if !@out_stack.peek
      while @in_stack.peek
        @out_stack.push(@in_stack.pop)
      end
    end

    if !@out_stack.peek
      raise StandardError("Can't dequeue from empty queue!")
    end

    @out_stack.pop
  end
end


















# Tests

def run_tests
  desc = 'basic queue operations'
  queue = QueueTwoStacks.new

  queue.enqueue(1)
  queue.enqueue(2)
  queue.enqueue(3)

  actual = queue.dequeue
  expected = 1
  assert_equal(actual, expected, desc)

  actual = queue.dequeue
  expected = 2
  assert_equal(actual, expected, desc)

  queue.enqueue(4)

  actual = queue.dequeue
  expected = 3
  assert_equal(actual, expected, desc)

  actual = queue.dequeue
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'error when dequeue from new queue'
  queue = QueueTwoStacks.new

  assert_raises(desc) { queue.dequeue }

  desc = 'error when dequeue from empty queue'
  queue = QueueTwoStacks.new

  queue.enqueue(1)
  queue.enqueue(2)

  actual = queue.dequeue
  expected = 1
  assert_equal(actual, expected, desc)

  actual = queue.dequeue
  expected = 2
  assert_equal(actual, expected, desc)

  assert_raises(desc) { queue.dequeue }
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
