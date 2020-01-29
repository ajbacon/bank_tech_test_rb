class InputValidation

  def initialize(amount)
    @amount = amount
  end

  def check
    check_string(@amount)
    check_negative(@amount)
    check_decimals(@amount)
    true
  end

  private

  def check_string(amount)
    raise StandardError, "please enter positive value to maximum of 2 decimal places" if amount.is_a? String
  end

  def check_negative(amount)
    raise StandardError, "please enter positive value to maximum of 2 decimal places" if amount.negative?
  end

  def check_decimals(amount)
    raise StandardError, "please enter positive value to maximum of 2 decimal places" if decimals(amount) > 2
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