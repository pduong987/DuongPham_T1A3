require_relative "database"

#Creat a new variable database
database = Database.new

#Login to the bank, get user input
puts "Login: "
username = gets.chomp

#Get the user for the specific user name
user = database.getUserByUsername(username)

#Loop to check if the user name is exits, will return user name with gretting,
if user != nil
    puts "Hi " + user.getName
#User name not exits , then print wrong input. 
else
    puts "Sorry, wrong input!"
end


