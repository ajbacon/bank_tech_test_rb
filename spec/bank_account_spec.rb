require 'bank_account'

describe BankAccount do
  let(:transaction_history) { double :transaction_history }
  let(:transaction) { double :transaction }
  subject { described_class.new(transaction_history) }

  before(:each) do
    allow(transaction_history).to receive :add
    allow(transaction).to receive :new
  end

  describe "#deposit" do
    it "takes a deposit of 1000 and increases the balance by 1000" do
      allow(transaction_history).to receive :add_transaction
      expect(subject.deposit(1000)).to equal 1000
    end
  end

  describe "#withdraw" do

    before(:each) do
      subject.deposit(1000)
    end
    
    it "takes a withdrawal of 500 and decreases the balance by 500" do
      expect(subject.withdraw(500)).to eq 500
    end

    it "should raise an error if the transaction goes beyond the minimum balance" do
      withdrawal = 1000 - BankAccount::MINIMUM_BALANCE + 10
      expect { subject.withdraw(withdrawal) }.to raise_error(StandardError, 'insufficient funds')
    end
  end 

  describe "#statement" do

    let(:print_statement1) { double :print_statement }
    before(:each) do
      allow(print_statement1).to receive(:print_header) { puts "date || credit || debit || balance" }
      allow(print_statement1).to receive(:print_transactions) { puts "14/01/2012 ||  || 500.00 || 500.00\n10/01/2012 || 1000.00 ||  || 1000.00" }
    end

    it "should print the statement to the console" do
      expect { subject.statement(print_statement1) }.to output("date || credit || debit || balance\n14/01/2012 ||  || 500.00 || 500.00\n10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end
