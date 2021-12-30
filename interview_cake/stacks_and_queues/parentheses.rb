def get_closing_paren(sentence, index)

  # Find the position of the matching closing parenthesis.
  if sentence[index] != '('
    raise ArgumentError, "Index must point to an opening parenthese."
  end
  
  open_count = 0
  
  (index + 1).upto(sentence.length - 1) do |i|
    char = sentence[i]
    if char == '('
      open_count += 1
    elsif char == ')' && open_count == 0
      return i
    elsif char == ')'
      open_count -= 1
    end
  end

  raise StandardError, "There is no closing parenthese!"
end


















# Tests

def run_tests
  desc = 'all openers then closers'
  actual = get_closing_paren('((((()))))', 2)
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'mixed openers and closers'
  actual = get_closing_paren('()()((()()))', 5)
  expected = 10
  assert_equal(actual, expected, desc)

  desc = 'no matching closer'
  assert_raises(desc) { get_closing_paren('()(()', 2) }
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
