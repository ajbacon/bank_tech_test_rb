class Transaction

  attr_reader :amount, :type, :date, :balance
  
  def initialize(amount, type, balance, date = Time.now.strftime("%d/%m/%Y"))
    @amount = amount
    @type = type
    @balance = balance
    @date = date
  end
end
