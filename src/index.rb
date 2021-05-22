require_relative "database"
require_relative "actions"

#Creat a new variable database
database = Database.new

#Login to the bank, get user input
puts "Login: "
puts
username = gets.chomp
puts 
puts

#Get the user for the specific user name
user = database.getUserByUsername(username)

#Loop to check if the user name is exits, will return user name with gretting,
if user != nil
    puts "Hi #{user.getName} " 
    puts 
    #new variable userId by get Id out of the user
    userId = user.getId
    #pass the user information to new array loggedInUserAccounts
    loggedInUserAccounts = database.getAccountsByUserId(userId)
    #if the length of loggedInuserAccounts greater than 0
    if loggedInUserAccounts.length > 0
        #Then print this
        puts "Please select which account: "
        puts ""
        puts "-----------------------------"
        #Loop through the array and get the account and index 
        loggedInUserAccounts.each_with_index { |account, index|
          
            puts " #{index}- #{account.getName}   " 
            puts ""
            puts "-----------------------------"
          
        }
        #if length of the array no greater than 0, then below msg will print out
    else
        puts "Sorry you dont have any accounts!"
    end
    puts ""
    accOpt = gets.chomp
    puts 
    #new account variable will be equal to the account option
    account = loggedInUserAccounts[accOpt.to_i]

    #loop to see if the account exits
    if account != nil

        #List available option eg deposite , withdraw transfer
        puts "============================="
        puts "What would you like to do with this account"
        puts "============================="
        puts "||    1- Deposite          ||"
        puts "||    2- Withdraw          ||"
        puts "||    3- Balance           ||" 
        puts "||    4- Transfer          || "
        puts "||    5- Mortgage_cal      ||"
        puts "||    6- Entertainment     ||"
        puts "============================="
        puts "============================="
        puts
        puts

        action = gets.chomp
        puts
        #Loop through to get each option out from the action input
        if action == "1"
            puts "Please enter the amount: "
            amount = gets.chomps
            #Get deposite been calculated in deposite method and return the amount 
            account.deposite(amount.to_i)
            puts "Thank you, we deposited $#{amount} to account #{account.getName}, your new balance is #{account.getBalance}"
        elsif action == "2"
            puts "Please enter the amount:"
            amount = gets.chomp
            #Get withdraw been calculated in withdraw method and return the amount
            account.withdraw(amount.to_i)
            puts "Thank you, we have withdrawn $#{amount} from account #{account.getName}, your new balance is #{account.getBalance}"
        elsif action == "3"
            puts "Your balance for #{account.getName} is #{account.getBalance}"
        elsif action == "4"
            # Get result from the loop in transfer method and return the answer
           transfer
        elsif action == "5"
            mortgage_calculator
        elsif action == "6"
            puts "Hope you have enjoy our recommendation. "
        else
            puts "Sorry thats not a valid action!"
        end

    else
        puts "Sorry, that is not a valid account!"
    end
    


#User name not exits , then print wrong input. 
else
    puts "Sorry #{username}, wrong input! " 
end

