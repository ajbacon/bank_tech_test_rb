require 'Transaction'

describe Transaction do

  let(:subject) { described_class.new(1000) }

  it "should have an amount" do
    expect(subject.amount).to eq 1000
  end
end
