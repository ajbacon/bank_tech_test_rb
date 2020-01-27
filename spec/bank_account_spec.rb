require 'bank_account'

describe BankAccount do
  let(:transaction) { double :transaction }

  before(:each) do
    subject { described_class.new() }
  end

  describe "#balance" do
    it "should have an initial balance of 0" do 
      expect(subject.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "takes a deposit of 1000 and increases the balance by 1000" do
      expect { subject.deposit(1000, transaction) }.to change { subject.balance }.by 1000
    end

    it "should store a new deposit transaction" do
      subject.deposit(1000, transaction)
      expect(subject.transactions).to include transaction
    end
  end

  describe "#withdraw" do
    it "takes a withdrawal of 500 and increases the balance by 500" do
      subject.deposit(1000, transaction)
      expect { subject.withdraw(500, transaction) }.to change { subject.balance }.by(-500)
    end

    it "should store a new withdrawal transaction" do
      subject.withdraw(1000, transaction)
      expect(subject.transactions).to include transaction
    end
  end
end
