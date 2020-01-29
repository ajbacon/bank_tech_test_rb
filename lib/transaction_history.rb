class TransactionHistory 

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add(amount, type, balance, transaction_obj = Transaction)
    transaction = transaction_obj.new(amount, type, balance)
    @transactions.unshift(transaction).first
  end
end
