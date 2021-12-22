require 'set'

class Node
  attr_accessor :value, :previous
  
  def initialize(value, previous)
    @value = value
    @previous = previous
  end
end

def reconstruct_path(current_node)
  reversed_path = []
  while current_node
    reversed_path << current_node.value
    current_node = current_node.previous
  end
  return reversed_path.reverse!
end

def get_path(graph, start_node, end_node)

  # Find the shortest route in the network between the two users.
  if !graph.keys.include?(start_node) || !graph.keys.include?(end_node)
    raise ArgumentError "The start and end node must be present in the graph."
  end
  
  queue = [Node.new(start_node, nil)]
  nodes_seen = Set.new
  
  while queue.length > 0
    node = queue.shift
    if node.value == end_node
      return reconstruct_path(node)
    end
    
    nodes_seen.add(node.value)
    graph[node.value].each do |value|
      if !nodes_seen.include?(value)
        queue.push(Node.new(value, node))
      end
    end
  end
      
  nil
end


















# Tests

def run_tests
  @graph = {
    a: [:b, :c, :d],
    b: [:a, :d],
    c: [:a, :e],
    d: [:a, :b],
    e: [:c],
    f: [:g],
    g: [:f],
  }

  desc = 'two hop path 1'
  actual = get_path(@graph, :a, :e)
  expected = [:a, :c, :e]
  assert_equal(actual, expected, desc)

  desc = 'two hop path 2'
  actual = get_path(@graph, :d, :c)
  expected = [:d, :a, :c]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 1'
  actual = get_path(@graph, :a, :c)
  expected = [:a, :c]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 2'
  actual = get_path(@graph, :f, :g)
  expected = [:f, :g]
  assert_equal(actual, expected, desc)

  desc = 'one hop path 3'
  actual = get_path(@graph, :g, :f)
  expected = [:g, :f]
  assert_equal(actual, expected, desc)

  desc = 'zero hop path'
  actual = get_path(@graph, :a, :a)
  expected = [:a]
  assert_equal(actual, expected, desc)

  desc = 'no path'
  actual = get_path(@graph, :a, :f)
  expected = nil
  assert_equal(actual, expected, desc)

  desc = 'start node not present'
  assert_raises(desc) { get_path(@graph, :h, :a) }

  desc = 'end node not present'
  assert_raises(desc) { get_path(@graph, :a, :h) }
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
