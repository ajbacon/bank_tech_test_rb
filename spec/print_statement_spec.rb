require 'print_statement'

describe PrintStatement do

  describe "#print_header" do
    it "should print the header to stdout" do 
      expect { subject.header }.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe "#print_transactions" do
  it "should print the header to stdout" do 
    expect { subject.header }.to output("date || credit || debit || balance\n").to_stdout
  end
end


end