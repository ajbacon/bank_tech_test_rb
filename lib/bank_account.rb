class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, transaction = Transaction.new())
    validate_amount(amount)
    @balance += amount
    @transactions << transaction
  end

  def withdraw(amount, transaction = Transaction.new())
    validate_amount(amount)
    @balance -= amount
    @transactions << transaction
  end

  private 

  def validate_amount(amount)
    check_string(amount)
    check_negative(amount)
    check_decimals(amount)
  end

  def check_string(amount)
    raise "please enter number to maximum of 2 decimal places" if amount.is_a? String
  end

  def check_negative(amount)
    raise "please enter number to maximum of 2 decimal places" if amount.negative?
  end

  def check_decimals(amount)
    raise "please enter number to maximum of 2 decimal places" if decimals(amount) > 2
  end

  def decimals(a)
    num = 0
    while(a != a.to_i)
        num += 1
        a *= 10
    end
    num   
  end

end
