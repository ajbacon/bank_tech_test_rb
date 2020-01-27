require 'Transaction'

describe Transaction do

  let(:subject) { described_class.new(1000, "CREDIT") }

  it "should have an amount" do
    expect(subject.amount).to eq 1000
  end

  it "should have a type" do
    expect(subject.type).to eq "CREDIT"
  end

end
