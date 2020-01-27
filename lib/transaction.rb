class Transaction

  attr_reader :amount, :type, :date, :balance
  
  def initialize(amount, type, balance, date = Time.now.strftime("%d/%m/%Y"))
    @amount = amount
    @type = type
    @balance = new_balance(balance)
    @date = date
  end

  private

  def new_balance(balance)
    @type == "CREDIT" ? balance + @amount : balance - @amount
  end
end
