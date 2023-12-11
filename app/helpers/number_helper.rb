module NumberHelper
  def randomized_number
    rand(1..100)
  end

  def randomized_number_with_exception
    raise ApiError.new(code: '40001', errors: ['Sending an exception from the helper'])
  end
end
