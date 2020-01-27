class TransactionHistory 

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(amount, balance)
    @transactions.unshift({
      date: add_date,
      credit: amount,
      debit: "",
      balance: balance + amount
    })
  end

  private

  def add_date
    Time.now.strftime("%d/%m/%Y")
  end

end