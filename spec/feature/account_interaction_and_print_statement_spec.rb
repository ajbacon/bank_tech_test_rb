require_relative '../../lib/bank_account'
require_relative '../../lib/transaction'
require_relative '../../lib/transaction_history'
require_relative '../../lib/print_statement'

describe "BankAccount" do
  
  it "should successfully print statement after depositing and withdrawing money" do

    account = BankAccount.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)

    date = Time.now.strftime("%d/%m/%Y")

    expectation = "date || credit || debit || balance\n#{date} ||  || 500.00 || 2500.00\n#{date} || 2000.00 ||  || 3000.00\n#{date} || 1000.00 ||  || 1000.00\n"

    expect { account.statement }.to output(expectation).to_stdout
  end
end
