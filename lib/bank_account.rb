require_relative 'transaction'
require_relative 'print_statement'
require_relative 'transaction_history'

class BankAccount
  attr_reader :balance

  MINIMUM_BALANCE = 0

  def initialize(history = TransactionHistory.new)
    @balance = 0
    @transactions = history
  end

  def deposit(amount, transaction_obj = Transaction)
    validate_amount(amount)
    @balance += amount
    @transactions.add(transaction_obj.new(amount, "CREDIT", @balance))
    "Deposit successful"
  end

  def withdraw(amount, transaction_obj = Transaction)
    validate_amount(amount, true)
    @balance -= amount
    @transactions.add(transaction_obj.new(amount, "DEBIT", @balance))
    "£#{'%.2f' % amount} withdrawn successfully"
  end

  def statement(print_statement = PrintStatement.new(@transactions))
    print_statement.print_header
    print_statement.print_transactions
  end

  private 

  def validate_amount(amount, debit = false)
    check_string(amount)
    check_negative(amount)
    check_decimals(amount)
    check_funds(amount) if debit
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

  def check_funds(amount)
    raise "insufficient funds" if @balance - amount < MINIMUM_BALANCE
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
