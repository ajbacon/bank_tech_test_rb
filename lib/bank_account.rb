class BankAccount
  attr_reader :balance, :transactions

  def initialize(history = TransactionHistory.new)
    @balance = 0
    @transactions = history
  end

  def deposit(amount, transaction = Transaction)
    validate_amount(amount)
    @balance += amount
    @transactions.add(transaction.new(amount, "CREDIT", @balance))
    "Deposit successful"
  end

  def withdraw(amount, transaction = Transaction)
    validate_amount(amount)
    @balance -= amount
    @transactions.add(transaction.new(amount, "CREDIT", @balance))
    "£#{amount} withdrawn successfully"
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

  def decimals(amount)
    num = 0
    while (amount != amount.to_i)
      num += 1
      amount *= 10
    end
    num   
  end

end
