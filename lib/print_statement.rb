class PrintStatement

  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print_header
    puts "date || credit || debit || balance"
  end

  def print_transactions
    @transaction_history.transactions.each do |transaction|
      amount_str = "|| #{'%.2f' % transaction.amount} ||  ||" if transaction.type == "CREDIT" 
      amount_str = "||  || #{'%.2f' % transaction.amount} ||" if transaction.type == "DEBIT" 
      puts "#{transaction.date} #{amount_str} #{'%.2f' % transaction.balance}"
    end
  end
end
