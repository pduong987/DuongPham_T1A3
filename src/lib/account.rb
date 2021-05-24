class Account

    # Create initialize method 
    def initialize(id, name, balance, userId)
        @id = id
        @name = name
        @balance = balance
        @userId = userId
    end

    def getUserId
        return @userId
    end

    def getName
        return @name
    end

    def getBalance
        return @balance
    end  

    
    def deposite(amount)
        @balance += amount
    end

    def withdraw(amount)
        @balance -= amount
    end



end