require 'transaction_history'

describe TransactionHistory do

  before(:each) do
    subject { described_class.new() }
  end

  describe "#add_transaction" do
    it "should add a credit transaction to the history" do 
      date = Time.now.strftime("%d/%m/%Y")
      amount, balance = 1000, 500
      subject.add_transaction(amount, balance)
      expect(subject.transactions).to eq [{ date: date, credit: amount, debit: "", balance: balance + amount }]
    end

    it "should add a debit transaction to the history" do 
      date = Time.now.strftime("%d/%m/%Y")
      amount, balance = -500, 1000
      subject.add_transaction(amount, balance)
      expect(subject.transactions).to eq [{ date: date, credit: "", debit: amount * -1, balance: balance + amount }]
    end
  end
end
