require "json"
require_relative "account"
require_relative "users"

class Database
    def initialize()




        #Load Account Json into ruby struture
        account_json = File.read("accounts.json")
        records = JSON.parse(account_json)

        # set accounts as an empty array 
        @accounts = []

        #loop through all the recods to create account object
        records.each { |record|
          acc = Account.new(record["id"], record["name"], record["balance"], record["userId"])
           #add new_accounts to array of account
           @accounts.push(acc)
        }


        #Load User Json into ruby struture
        user_json = File.read("users.json")
        records = JSON.parse(user_json)

        # set users as an empty array 
        @users = []

        #loop through all the recods to create user object
        records.each { |record|
            usr = User.new(record["id"], record["name"], record["username"])
           #add new_users to array of user
           @users.push(usr)
        }
    end

    # get all accounts object
    def getAccounts
        return @accounts

    end

    def getAccountsByUserId(userId)
        userAccounts = []
        #Loopt through to push accounts into userAccounts
        @accounts.each { |account|
            if account.getUserId == userId
                userAccounts.push(account)
            end
        }
        return userAccounts
    end

    #get all users object
    def getUsers
        return @users
    end

    # Looks through all users to find user with a speific username
    def getUserByUsername(username)
        
        @users.each {|user| 
            if user.getUsername == username
                return user
            end
        }

        return nil
        
    end 

end

