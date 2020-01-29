class Transaction

  attr_reader :amount, :type, :balance, :date
  
  def initialize(amount, type, balance, date = Time.now.strftime("%d/%m/%Y"))
    @amount = amount
    @type = type
    @balance = update_balance(amount, balance, type)
    @date = date
  end

  private

  def update_balance(amount, balance, type)
    type == "CREDIT" ? balance + amount : balance - amount
  end
end
