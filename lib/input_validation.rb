module InputValidation
  INPUT_ERROR = "please enter positive value to maximum of 2 decimal places" 
  def check_input(amount)
    check_string(amount)
    check_negative(amount)
    check_decimals(amount)
    true
  end

  private

  def check_string(amount)
    raise StandardError, INPUT_ERROR if amount.is_a? String
  end

  def check_negative(amount)
    raise StandardError, INPUT_ERROR if amount.negative?
  end

  def check_decimals(amount)
    raise StandardError, INPUT_ERROR if decimals(amount) > 2
  end

  def decimals(amount)
    num = 0
    while (amount != amount.to_i)
      num += 1
      amount *= 10
    end
    num   
  end
end
