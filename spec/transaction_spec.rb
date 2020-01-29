require 'transaction'

describe Transaction do

  let(:subject) { described_class.new(1000, "CREDIT", 1000, "27/01/2020") }

  it "should have an amount" do
    expect(subject.amount).to eq 1000
  end

  it "should have a type" do
    expect(subject.type).to eq "CREDIT"
  end

  it "should have a date attached" do
    expect(subject.date).to eq "27/01/2020"
  end


  describe "#balance" do
    let(:credit) { described_class.new(1000, "CREDIT", 1000, "27/01/2020") }
    let(:debit) { described_class.new(500, "DEBIT", 1000, "27/01/2020") }

    it "should update the balance by adding the amount if the transaction type is 'CREDIT" do
      expect(credit.balance).to eq 2000
    end

    it "should update the balance by adding the amount if the transaction type is 'DEBIT" do
      expect(debit.balance).to eq 500
    end
  end
end
