require 'set'
class WordCloudData
  attr_reader :words_to_counts

  def initialize(input_string)
  
    # Count the frequency of each word.
    @words_to_counts = Hash.new(0)
    
    current_word = ''
    input_string.each_char do |char|
      if word_char(char)
        current_word += char
      elsif hyphen(char)
        current_word += char if current_word != ''
      else
        @words_to_counts[current_word] += 1 if current_word != ''
        current_word = ''
      end
    end
    
    @words_to_counts[current_word] += 1 if current_word != ''
    
    condense_different_cases
  end
  
  def word_char(char)
    value = char.downcase.ord
    (value >= 97 && value <= 122) || (value == 39)
  end
  
  def hyphen(char)
    char.ord == 45
  end
  
  def condense_different_cases
    words_seen = Set.new()
    @words_to_counts.keys.each do |key|
      if words_seen.include?(key.capitalize)
        @words_to_counts[key] += @words_to_counts[key.capitalize]
        @words_to_counts.delete(key.capitalize)
      else
        words_seen.add(key)
      end
    end
  end
end


















# Tests

def run_tests
  desc = 'simple sentence'
  input = 'I like cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'I' => 1, 'like' => 1, 'cake' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'longer sentence'
  input = 'Chocolate cake for dinner and pound cake for dessert'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {
    'and' => 1,
    'pound' => 1,
    'for' => 2,
    'dessert' => 1,
    'Chocolate' => 1,
    'dinner' => 1,
    'cake' => 2,
  }
  assert_equal(actual, expected, desc)

  desc = 'punctuation'
  input = 'Strawberry short cake? Yum!'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Strawberry' => 1, 'short' => 1, 'Yum' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'hyphenated words'
  input = 'Dessert - mille-feuille cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'cake' => 1, 'Dessert' => 1, 'mille-feuille' => 1 }
  assert_equal(actual, expected, desc)

  desc = 'ellipses between words'
  input = 'Mmm...mmm...decisions...decisions'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'mmm' => 2, 'decisions' => 2 }
  assert_equal(actual, expected, desc)

  desc = 'apostrophes'
  input = "Allie's Bakery: Sasha's Cakes"

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = { 'Bakery' => 1, 'Cakes' => 1, "Allie's" => 1, "Sasha's" => 1 }
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
