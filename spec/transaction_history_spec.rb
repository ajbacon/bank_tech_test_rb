require 'transaction_history'

describe TransactionHistory do

  let(:subject) { described_class.new() }
  let(:transaction1) { double :transaction }
  let(:transaction2) { double :transaction }

  let(:transaction_obj) { double :transaction, new: transaction1 }

  describe "#add" do
    it "should return a new transaction" do 
      expect(subject.add(1000, "CREDIT", 1000, transaction_obj)).to eq transaction1
    end
  end

  describe "#transactions" do
    before(:each) do
      allow(transaction1).to receive(:date) { "27/01/2020" }
      allow(transaction2).to receive(:date) { "28/01/2020" }
      allow(transaction_obj).to receive(:new).and_return(transaction1, transaction2)
      subject.add(1000, "CREDIT", 1000, transaction_obj)
      subject.add(500, "DEBIT", 500, transaction_obj)
    end

    it "should return an array of stored transactions" do 
      expect(subject.transactions).to eq([transaction2, transaction1])
    end

    it "should store the newest transaction at the beginning of the array" do 
      expect(subject.transactions.first.date).to eq("28/01/2020")
    end
  end
  
end
