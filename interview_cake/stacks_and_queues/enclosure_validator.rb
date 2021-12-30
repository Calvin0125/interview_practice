def valid?(code)

  # Determine if the input code is valid.
  enclosure_stack = []
  
  code.each_char do |char|
    if opener?(char)
      enclosure_stack << char
    elsif closer?(char)
      opener = enclosure_stack.pop
      if !enclosures_match?(opener, char)
        return false
      end
    end
  end

  enclosure_stack.empty?
end

def enclosures_match?(opener, closer)
  return (opener == '(' && closer == ')') ||
         (opener == '[' && closer == ']') ||
         (opener == '{' && closer == '}')
end

def opener?(char)
  return char == '(' || char == '[' || char == '{'
end

def closer?(char)
  return char == ')' || char == ']' || char == '}'
end
















# Tests

def run_tests
  desc = 'valid short code'
  result = valid?('()')
  assert_true(result, desc)

  desc = 'valid longer code'
  result = valid?('([]{[]})[]{{}()}')
  assert_true(result, desc)

  desc = 'interleaved openers and closers'
  result = valid?('([)]')
  assert_false(result, desc)

  desc = 'mismatched opener and closer'
  result = valid?('([][]}')
  assert_false(result, desc)

  desc = 'missing closer'
  result = valid?('[[]()')
  assert_false(result, desc)

  desc = 'extra closer'
  result = valid?('[[]]())')
  assert_false(result, desc)

  desc = 'empty string'
  result = valid?('')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
