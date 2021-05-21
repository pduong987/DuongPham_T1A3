require_relative "database"

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
    userAccountOption = gets.chomp

    balance = loggedInUserAccounts[userAccountOption.to_i].getBalance

    puts ""
    puts "Your Balance = #{balance}" 
    puts ""
    
    
    
    # #List available option eg deposite , withdraw transfer
    # puts "============================="
    # puts "============================="
    # puts "||      1- Deposite        ||"
    # puts "||      2- Withdraw        ||"
    # puts "||      3- Balance         ||" 
    # puts "||      4- Transfer        || "
    # puts "||      5- Mortgage        ||"
    # puts "||      6- Entertainment   ||"
    # puts "============================="
    # puts "============================="
    # puts
    # puts
    # get user option
   
   
   
    #Create diffirent fuction 
    


#User name not exits , then print wrong input. 
else
    puts "Sorry #{username}, wrong input! " 
end


