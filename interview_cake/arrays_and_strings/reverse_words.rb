def reverse_words!(message)

  # Decode the message by reversing the words.
  
  reverse_chars(message, 0, message.length - 1)
  
  word_start = 0 
  (0..message.length).each do |i|
    if message[i] == ' ' || i == message.length
      reverse_chars(message, word_start, i - 1)
      word_start = i + 1
    end
  end
end

def reverse_chars(string, start_index, end_index)
  while end_index > start_index 
    placeholder = string[start_index]
    string[start_index] = string[end_index]
    string[end_index] = placeholder
    start_index += 1
    end_index -= 1
  end
end


















# Tests

def run_tests
  desc = 'one word'
  message = 'vault'
  reverse_words!(message)
  expected = 'vault'
  assert_equal(message, expected, desc)

  desc = 'two words'
  message = 'thief cake'
  reverse_words!(message)
  expected = 'cake thief'
  assert_equal(message, expected, desc)

  desc = 'three words'
  message = 'one another get'
  reverse_words!(message)
  expected = 'get another one'
  assert_equal(message, expected, desc)

  desc = 'multiple words same length'
  message = 'rat the ate cat the'
  reverse_words!(message)
  expected = 'the cat ate the rat'
  assert_equal(message, expected, desc)

  desc = 'multiple words different lengths'
  message = 'yummy is cake bundt chocolate'
  reverse_words!(message)
  expected = 'chocolate bundt cake is yummy'
  assert_equal(message, expected, desc)

  desc = 'empty string'
  message = ''
  reverse_words!(message)
  expected = ''
  assert_equal(message, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
