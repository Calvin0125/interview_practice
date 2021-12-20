def merge_arrays(array1, array2)
  array1_index = 0
  array2_index = 0
  merged_array = []
  
  while array1_index < array1.length && array2_index < array2.length
    if array1[array1_index] < array2[array2_index]
      merged_array.push(array1[array1_index])
      array1_index += 1
    else
      merged_array.push(array2[array2_index])
      array2_index += 1
    end
  end
  
  if array1_index < array1.length
    merged_array += array1[array1_index..-1]
  elsif array2_index < array2.length
    merged_array += array2[array2_index..-1]
  end
  
  merged_array
end


















# Tests

def run_tests
  desc = 'both arrays are empty'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
