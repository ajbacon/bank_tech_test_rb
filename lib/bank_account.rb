require_relative 'transaction'
require_relative 'print_statement'
require_relative 'transaction_history'
require_relative 'input_validation'

class BankAccount
  include InputValidation

  MINIMUM_BALANCE = 0

  def initialize(history = TransactionHistory.new)
    @balance = 0
    @transactions = history
  end

  def deposit(amount, transaction_obj = Transaction)
    self.check_input(amount)
    
    @transactions.add(amount, "CREDIT", @balance)
    @balance += amount
  end

  def withdraw(amount, transaction_obj = Transaction)
    self.check_input(amount)
    raise StandardError, "insufficient funds" if @balance - amount < MINIMUM_BALANCE
    
    @transactions.add(amount, "DEBIT", @balance)
    @balance -= amount
  end

  def statement(print_statement = PrintStatement.new(@transactions))
    print_statement.print_header
    print_statement.print_transactions
  end

end
