require 'bank_account'

describe BankAccount do
  let(:transaction_history) { double :transaction_history }
  let(:transaction) { double :transaction }
  subject { described_class.new(transaction_history) }

  before(:each) do
    allow(transaction_history).to receive :add
    allow(transaction).to receive :new
  end

  describe "#balance" do
    it "should have an initial balance of 0" do 
      expect(subject.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "takes a deposit of 1000 and increases the balance by 1000" do
      allow(transaction_history).to receive :add_transaction
      expect { subject.deposit(1000, transaction) }.to change { subject.balance }.by 1000
    end

    it "gives confirmation of the deposit" do
      allow(transaction_history).to receive :add_transaction
      expect(subject.deposit(1000, transaction)).to eq "Deposit successful"
    end

    context "input validation" do
      it "should raise an error if a string is input" do
        expect { subject.deposit("string", transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a negative number is input" do
        expect { subject.deposit(-100.00, transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a numnber with more than 2 decimal places is input" do
        expect { subject.deposit(123.456, transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should not raise an error if a postive number with 2 decimal is added" do
        expect { subject.deposit(123.45, transaction) }.to change { subject.balance }.by 123.45
      end
    end

  end

  describe "#withdraw" do
    it "takes a withdrawal of 500 and decreases the balance by 500" do
      subject.deposit(1000, transaction)
      expect { subject.withdraw(500, transaction) }.to change { subject.balance }.by(-500)
    end

    it "gives confirmation of the withdrawal" do
      subject.deposit(1000, transaction)
      expect(subject.withdraw(500, transaction)).to eq "£500 withdrawn successfully"
    end

    context "input validation" do

      before(:each) do
        subject.deposit(1000, transaction)
      end

      it "should raise an error if a string is input" do
        expect { subject.withdraw("string", transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a negative number is input" do
        expect { subject.withdraw(-100.00, transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a number with more than 2 decimal places is input" do
        expect { subject.withdraw(123.456, transaction) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should not raise an error if a postive number with 2 decimal is added" do
        subject.withdraw(123.45, transaction)
        expect(subject.balance).to be_within(0.000000000001).of(876.55)
      end

      it "should raise an error if the transaction goes beyond the minimum balance" do
        withdrawal = 1000 - BankAccount::MINIMUM_BALANCE + 10
        expect { subject.withdraw(withdrawal, transaction) }.to raise_error "insufficient funds"
      end
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
