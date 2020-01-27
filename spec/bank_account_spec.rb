require 'bank_account'

describe BankAccount do
  let(:transaction_history) { double :transaction_history }
  subject { described_class.new(transaction_history) }

  before(:each) do
    allow(transaction_history).to receive (:add_transaction)
  end

  describe "#balance" do
    it "should have an initial balance of 0" do 
      expect(subject.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "takes a deposit of 1000 and increases the balance by 1000" do
      allow(transaction_history).to receive (:add_transaction)
      expect { subject.deposit(1000) }.to change { subject.balance }.by 1000
    end

    # it "should store a new deposit transaction" do
    #   allow(transaction_history).to receive (:add_transaction)
    #   subject.deposit(1000)
    #   expect(subject.transactions).to include transaction
    # end

    context "input validation" do
      it "should raise an error if a string is input" do
        expect { subject.deposit("string") }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a negative number is input" do
        expect { subject.deposit(-100.00) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a numnber with more than 2 decimal places is input" do
        expect { subject.deposit(123.456) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should not raise an error if a postive number with 2 decimal is added" do
        expect { subject.deposit(123.45) }.to change { subject.balance }.by 123.45
      end
    end

  end

  describe "#withdraw" do
    it "takes a withdrawal of 500 and decreases the balance by 500" do
      subject.deposit(1000)
      expect { subject.withdraw(500) }.to change { subject.balance }.by(-500)
    end

    # it "should store a new withdrawal transaction" do
    #   subject.withdraw(1000)
    #   expect(subject.transactions).to include transaction
    # end

    context "input validation" do
      it "should raise an error if a string is input" do
        expect { subject.withdraw("string") }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a negative number is input" do
        expect { subject.withdraw(-100.00) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should raise an error if a numnber with more than 2 decimal places is input" do
        expect { subject.withdraw(123.456) }.to raise_error "please enter number to maximum of 2 decimal places"
      end

      it "should not raise an error if a postive number with 2 decimal is added" do
        expect { subject.withdraw(123.45) }.to change { subject.balance }.by -123.45
      end
    end
  end

  
end
