
#Test case:
# 1.Test in the account if balance get deposite money come in
# 2.Test in the account if balance got withdraw money come out 
# 3.Test in the account if user name is available


require_relative "../account.rb"

describe Account do
    it "deposit adds to balance" do

        # Create a new account for us to test
        acc = Account.new(1,"My Account",999,1)

        acc.deposite(1)

        expect(acc.getBalance).to eq(1000)
    end 

    it "withdraw removes from balance" do
        acc = Account.new(1,"My Account",999,123)

        acc.withdraw(1)

        expect(acc.getBalance).to eq(998)
    end  
    
    it "setting account name works" do
        acc = Account.new(1,"My Account",999,123)

        expect(acc.getName).to eq("My Account")
    end      

end