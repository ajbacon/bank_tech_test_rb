require_relative '../../lib/bank_account'

describe "BankAccount" do
  
  it "should successfully print statement after depositing and withdrawing money" do

    Timecop.freeze

    account = BankAccount.new
    expectation = "date || credit || debit || balance\n"
    expect { account.statement }.to output(expectation).to_stdout

    Timecop.return
  end
end
