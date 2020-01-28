require 'transaction'

describe Transaction do

  let(:subject) { described_class.new(1000, "CREDIT", 500, "27/01/2020") }

  it "should have an amount" do
    expect(subject.amount).to eq 1000
  end

  it "should have a type" do
    expect(subject.type).to eq "CREDIT"
  end

  it "should have a date attached" do
    expect(subject.date).to eq "27/01/2020"
  end

  it "should update the total balance" do
    expect(subject.balance).to eq 1500
  end
end
