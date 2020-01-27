class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, transaction = Transaction.new())
    @balance += amount
    @transactions << transaction
  end

  def withdraw(amount, transaction = Transaction.new())
    @balance -= amount
    @transactions << transaction
  end

end
