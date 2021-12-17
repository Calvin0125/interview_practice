def get_max_profit(stock_prices)

  # Calculate the max profit.
  if stock_prices.length < 2
    raise ArgumentError, 'Getting a profit requires at least 2 prices'
  end
  
  buy = stock_prices[0]
  max_profit = stock_prices[1] - stock_prices[0]
  
  stock_prices.slice(1..-1).each do |sell|
    if sell - buy > max_profit
      max_profit = sell - buy
    end
    
    if sell < buy
      buy = sell
    end
  end
  
  max_profit
end


















# Tests

def run_tests
  desc = 'price goes up then down'
  actual = get_max_profit([1, 5, 3, 2])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'price goes down then up'
  actual = get_max_profit([7, 2, 8, 9])
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'big increase then small increase'
  actual = get_max_profit([2, 10, 1, 4])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes up all day'
  actual = get_max_profit([1, 6, 7, 9])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes down all day'
  actual = get_max_profit([9, 7, 4, 1])
  expected = -2
  assert_equal(actual, expected, desc)

  desc = 'price stays the same all day'
  actual = get_max_profit([1, 1, 1, 1])
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'error with empty prices'
  assert_raises(desc) {
    get_max_profit([])
  }

  desc = 'error with one price'
  assert_raises(desc) {
    get_max_profit([1])
  }
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
