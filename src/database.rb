require "json"
require_relative "account"

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
    end

    def getAccounts
        return @accounts

    end

        

    end

