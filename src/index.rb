require_relative "database"
require_relative "actions"
require "colorize"
require "tty-prompt"
require "google_places"

prompt = TTY::Prompt.new()

# This function securely gets the API key needed to talk to Google Places API
def getGoogleApiKey
    return File.read("../google-maps-key.txt").to_s
end

# Here we get the key using the secure function
googleMapApiKey = getGoogleApiKey

# Create a client to make calling the Google Places API... super easy
gmc = GooglePlaces::Client.new(googleMapApiKey)

def display_ascii_art 
    return File.read("art.txt")
  end

  puts display_ascii_art.red

#   puts ColorizedString["This is blue"].colorize(:blue)

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
    puts "Hi #{user.getName}. Welcome to Bank Smart." 
    puts 
    #new variable userId by get Id out of the user
    userId = user.getId
    #pass the user information to new array loggedInUserAccounts
    loggedInUserAccounts = database.getAccountsByUserId(userId)

    account = nil

    #if the length of loggedInuserAccounts greater than 0
    if loggedInUserAccounts.length > 0

        account_options = []

        loggedInUserAccounts.each { |acc|
            account_options.push(acc.getName)
        }

        account_options.push("Exit")

        selected_account_name = prompt.select("Please select one of your accounts:",account_options)

        if selected_account_name == "Exit"
            exit
        end

 
        # Now we have the name of the account, lets find the object
        loggedInUserAccounts.each { |acc|

            if acc.getName == selected_account_name
                account = acc
             
            end

        }

    #if length of the array no greater than 0, then below msg will print out
    else
        puts "Sorry you dont have any accounts!"
    end
    puts ""
    puts 

    #loop to see if the account exits
    if account != nil

        #Using gem TTY-promt to slect the coices.
        choices = ["Deposite", "Withdraw", "Balance", "Transfer", "Mortgage Calculator", "Entertainment", "Exit"]
        action = prompt.select("What would you like to do with this account?", choices)

        #Loop through to get each option out from the action input
        if action == "Deposite"
            puts "Please enter the amount: "
            amount = gets.chomp
            #Get deposite been calculated in deposite method and return the amount 
            account.deposite(amount.to_i)
            puts "Thank you, we deposited $#{amount} to your #{account.getName}, your new balance is $#{account.getBalance}"
            puts "Would you like to do anythingesle?"

        elsif action == "Withdraw"
            puts "Please enter the amount:"
            amount = gets.chomp
            #Get withdraw been calculated in withdraw method and return the amount
            account.withdraw(amount.to_i)
            puts "Thank you, we have withdrawn $#{amount} from your #{account.getName}, your new balance is $#{account.getBalance}"
        elsif action == "Balance"
            puts "Your balance for #{account.getName} is #{account.getBalance}"
        elsif action == "Transfer"
            # Get result from the loop in transfer method and return the answer
           transfer
        elsif action == "Mortgage Calculator"
            #Get mortgage calculator from action. 
            mortgage_calculator
        elsif action == "Entertainment"

            # Ask the user where they want to go... we will use the query directly on the Google Places API
            puts "Let's have some fun... what are you looking for ?"
            query = gets.chomp

            # Call the Google Places API with query we got from use
            places = gmc.spots_by_query(query)

            puts ""

            available_places = []

            # Make a simple array of places with the name and address
            places.each {|place|
                available_places.push("#{place.name} at #{place.formatted_address}")
            }

            # Ask the user to select one of those places...
            selected_place = prompt.select("I found these places, where do you want to go...", available_places)

            # Simple message to say we are going to that place... could be much more in the future
            puts "Thanks... we will go to " + selected_place
            
        elsif action == "Exit"
            puts "Thanks for using Banks Smart. Good bye!"
            exit
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



