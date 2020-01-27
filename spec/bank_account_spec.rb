require 'bank_account'

describe BankAccount do

  before(:each) do
    subject { described_class.new() }
  end

  describe "#balance" do
    it "should have an initial balance of 0" do 
      expect(subject.balance).to eq 0
    end
  end
end
