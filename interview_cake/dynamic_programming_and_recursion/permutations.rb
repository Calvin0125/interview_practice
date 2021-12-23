require 'set'

def get_permutations(string)

  # Generate all permutations of the input string.
  return Set.new([string]) if string.length <= 1
  
  permutations = Set.new
  sub_permutations = get_permutations(string[1..-1])
  sub_permutations.each do |sub_permutation|
    0.upto(sub_permutation.length) do |n|
      permutations.add(sub_permutation.dup.insert(n, string[0]))
    end
  end
  permutations
end


















# Tests

def run_tests
  desc = 'empty string'
  actual = get_permutations('')
  expected = Set.new([''])
  assert_equal(actual, expected, desc)

  desc = 'one character string'
  actual = get_permutations('a')
  expected = Set.new(['a'])
  assert_equal(actual, expected, desc)

  desc = 'two character string'
  actual = get_permutations('ab')
  expected = Set.new(['ab', 'ba'])
  assert_equal(actual, expected, desc)

  desc = 'three character string'
  actual = get_permutations('abc')
  expected = Set.new(['abc', 'acb', 'bac', 'bca', 'cab', 'cba'])
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
