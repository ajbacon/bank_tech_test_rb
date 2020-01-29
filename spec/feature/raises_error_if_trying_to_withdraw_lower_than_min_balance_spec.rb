require_relative '../../lib/bank_account'

describe "BankAccount" do
  
  it "should successfully print statement after depositing and withdrawing money" do

    Timecop.freeze

    account = BankAccount.new
    account.deposit(1000)
    expect { account.withdraw(1500) }.to raise_error(StandardError, "insufficient funds")

    Timecop.return
  end
end
