class Transaction

  attr_reader :amount, :type, :date, :balance
  
  def initialize(amount, type, date = Time.now.strftime("%d/%m/%Y"), balance)
    @amount = amount
    @type = type
    @date = date
    @balance = new_balance(balance)
  end

  private

  def new_balance(balance)
    @type == "CREDIT" ? balance + @amount : balance - @amount
  end

end
