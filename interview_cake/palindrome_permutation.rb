def has_palindrome_permutation?(the_string)

  # Check if any permutation of the input is a palindrome.
  letters = Hash.new(0)
  the_string.each_char { |char| letters[char] += 1 }
  
  odds = 0
  letters.values.each do |value|
    if the_string.length % 2 == 0 && value % 2 == 1
      return false
    elsif value % 2 == 1
      odds += 1
    end
    return false if odds >= 2
  end
  
  return true
end


















# Tests

def run_tests
  desc = 'permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcbcd')
  assert_true(result, desc)

  desc = 'permutation with even number of chars'
  result = has_palindrome_permutation?('aabccbdd')
  assert_true(result, desc)

  desc = 'no permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcd')
  assert_false(result, desc)

  desc = 'no permutation with even number of chars'
  result = has_palindrome_permutation?('aabbcd')
  assert_false(result, desc)

  desc = 'empty string'
  result = has_palindrome_permutation?('')
  assert_true(result, desc)

  desc = 'one character string'
  result = has_palindrome_permutation?('a')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
