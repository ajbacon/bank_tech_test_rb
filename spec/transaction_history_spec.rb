require 'transaction_history'

describe TransactionHistory do

  let(:subject) { described_class.new() }
  let(:transaction1) { double :transaction}
  let(:transaction2) { double :transaction}

  describe "#add" do
    it "should add a transaction to the history" do 
      subject.add(transaction1)
      expect(subject.transactions).to eq [transaction1]
    end
  end
end
