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
    puts "Hi " + user.getName + "\n\n"
    
    #Create a show menu function

    userId = user.getId

    loggedInUserAccounts = database.getAccountsByUserId(userId)

    if loggedInUserAccounts.length > 0
        puts "Please select which account: "
        puts ""
        puts "-----------------------------"
        loggedInUserAccounts.each_with_index { |account, index|
          
            puts " #{index}- #{account.getName}   " 
            puts ""
            puts "-----------------------------"
          
        }

    else
        puts "Sorry you dont have any accounts!"
    end
    puts ""
    accOpt = gets.chomp

    account = loggedInUserAccounts[accOpt.to_i]

    if account != nil

        # #List available option eg deposite , withdraw transfer
        puts "============================="
        puts "What would you like to do with this account"
        puts "============================="
        puts "||      1- Deposite        ||"
        puts "||      2- Withdraw        ||"
        puts "||      3- Balance         ||" 
        puts "||      4- Transfer        || "
        puts "||      5- Mortgage        ||"
        puts "||      6- Entertainment   ||"
        puts "============================="
        puts "============================="
        puts
        puts

        action = gets.chomp

        if action == "1"
            puts "Please enter the amount: "
            amount = gets.chomp
            puts "Thank you, we deposited $#{amount} to account #{account.getName}"
        elsif action == "2"
            puts "Please enter the amount:"
            amount = gets.chomp
            puts "Here is $#{amount}. "
        elsif action == "3"
            puts "Your balance for #{account.getName} is #{account.getBalance}"
        elsif action == "4"
           transfer
        elsif action == "5"
            puts "Have you got a mortgage account with us?"
        elsif action == "6"
            puts "Hope you have enjoy our recommendation. "
        else
            puts "Sorry thats not a valid action!"
        end

    else
        puts "Sorry, that is not a valid account!"
    end
   
    #Create diffirent fuction 
    


#User name not exits , then print wrong input. 
else
    puts "Sorry #{username}, wrong input! " 
end

