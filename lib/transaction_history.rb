class TransactionHistory 

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(amount, balance)
    @transactions.unshift({
      date: Time.now.strftime("%d/%m/%Y"),
      credit: amount,
      debit: "",
      balance: balance + amount
    })
  end
end
