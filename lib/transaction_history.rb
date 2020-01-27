class TransactionHistory 

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(amount, balance)
    @transactions.unshift({
      date: add_date,
      credit: add_credit(amount),
      debit: add_debit(amount),
      balance: balance + amount
    })
  end

  private

  def add_date
    Time.now.strftime("%d/%m/%Y")
  end

  def add_credit(amount)
    amount.negative? ? "" : amount
  end

  def add_debit(amount)
    amount.negative? ? (amount * -1) : ""
  end
end
