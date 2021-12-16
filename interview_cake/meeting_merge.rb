def merge_ranges(meetings)

    # Merge meeting ranges.
    meetings.sort_by! { |arr| arr[0] }
    meeting_start = meetings[0][0]
    meeting_end = meetings[0][1]
    merged_meetings = []
    
    meetings.each_with_index do |meeting, index|
      meeting_end = meeting[1] if meeting[1] > meeting_end
      
      if index == meetings.length - 1
        merged_meetings.push([meeting_start, meeting_end])
        break
      end
      
      if meeting_end < meetings[index + 1][0]
        merged_meetings.push([meeting_start, meeting_end])
        meeting_start = meetings[index + 1][0] 
        meeting_end = meetings[index + 1][1]
      end
    end

    merged_meetings 
end

def run_tests
  desc = 'meetings overlap'
  actual = merge_ranges([[1, 3], [2, 4]])
  expected = [[1, 4]]
  assert_equal(actual, expected, desc)

  desc = 'meetings touch'
  actual = merge_ranges([[5, 6], [6, 8]])
  expected = [[5, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meeting contains other meeting'
  actual = merge_ranges([[1, 8], [2, 5]])
  expected = [[1, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meetings stay separate'
  actual = merge_ranges([[1, 3], [4, 8]])
  expected = [[1, 3], [4, 8]]
  assert_equal(actual, expected, desc)

  desc = 'multiple merged meetings'
  actual = merge_ranges([[1, 4], [2, 5], [5, 8]])
  expected = [[1, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meetings not sorted'
  actual = merge_ranges([[5, 8], [1, 4], [6, 8]])
  expected = [[1, 4], [5, 8]]
  assert_equal(actual, expected, desc)

  desc = 'oneLongMeetingContainsSmallerMeetings'
  actual = merge_ranges([[1, 10], [2, 5], [6, 8], [9, 10], [10, 12]])
  expected = [[1, 12]]
  assert_equal(actual, expected, desc)

  desc = 'sample input'
  actual = merge_ranges([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]])
  expected = [[0, 1], [3, 8], [9, 12]]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
