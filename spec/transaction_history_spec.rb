require 'transaction_history'

describe TransactionHistory do

  let(:subject) { described_class.new() }
  let(:transaction1) { double :transaction }
  let(:transaction2) { double :transaction }

  describe "#add" do
    it "should add a transaction to the history" do 
      subject.add(transaction1)
      expect(subject.transactions).to eq [transaction1]
    end

    it "should add newest transactin to the beginning of the transactions array" do 
      allow(transaction1).to receive(:date) { "27/01/2020" }
      allow(transaction2).to receive(:date) { "28/01/2020" }
      
      subject.add(transaction1)
      subject.add(transaction2)
      expect(subject.transactions[0]).to eq transaction2
    end
  end
end
