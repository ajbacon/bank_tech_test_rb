require 'print_statement'

describe PrintStatement do
  let(:transaction_history) { double :transaction_history }
  let(:transaction1) { double :transaction, amount: 1000.00, type: "CREDIT", date: "10/01/2012", balance: 1000.00 }
  let(:transaction2) { double :transaction, amount: 500.00, type: "DEBIT", date: "14/01/2012", balance: 500.00 }
  subject { described_class.new(transaction_history) }

  describe "#print_header" do
    it "should print the header to stdout" do 
      expect { subject.print_header }.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe "#print_transactions" do
    it "should print the transactions to stdout, given an array of transactions" do 
      allow(transaction_history).to receive(:transactions) { [transaction2, transaction1] }
      expect { subject.print_transactions }.to output("14/01/2012 ||  || 500.00 || 500.00\n10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end
