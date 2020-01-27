class TransactionHistory 

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add(transaction)
    @transactions.unshift(transaction)
  end
end
