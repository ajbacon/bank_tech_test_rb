describe BankAccount do

  before(:each) do
    account = BankAccount.new
  end

  describe "#balance" do
    it "should have an initial balance of 0" do 
      expect(account.balance()).to eq 0
    end
  end
  
end