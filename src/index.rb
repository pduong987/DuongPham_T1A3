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

#Creat a new variable database
database = Database.new  

show_menu_1 = true
show_menu_2 = true
show_menu_3 = true
show_menu_4 = true

# Menu 1 = The Main login menu

# While the user wants to see Menu 1
while show_menu_1 == true

    # Show the welcome banner
    puts display_ascii_art.red


    while show_menu_2 == true

        #Login to the bank, get user input
        puts "Login: "
        username = gets.chomp

        #Get the user for the specific user name
        user = database.getUserByUsername(username)

        #Loop to check if the user name is exits, will return user name with gretting,
        if user != nil

            # Welcome the selected user
            puts "Hi #{user.getName}. Welcome to Bank Smart." 
 
            #new variable userId by get Id out of the user
            userId = user.getId

            # Get all accounts for the selected user
            loggedInUserAccounts = database.getAccountsByUserId(userId)

      
            #if the length of loggedInuserAccounts greater than 0
            if loggedInUserAccounts.length > 0

                # Holds a list of account options based on selected user
                account_options = []

                # Loop through and add each account as an option
                loggedInUserAccounts.each { |acc|
                    account_options.push(acc.getName)
                }

                # Add a final option which allows the user to exist (break loop)
                account_options.push("Exit")

                while show_menu_3 == true

                    # This is the account a user then selects
                    account = nil

                    selected_account_name = prompt.select("Please select one of your accounts:",account_options)

                    # If the user has broken the while loop, we stop asking them to select an account and got back to main screen
                    if selected_account_name == "Exit"
                        break
                    end

                    # Now we have the name of the account, lets find the object
                    loggedInUserAccounts.each { |acc|

                        if acc.getName == selected_account_name
                            account = acc
                        end

                    }

                    #loop to see if the account exits
                    if account != nil

                        #Using gem TTY-promt to slect the coices.
                        choices = ["Deposite", "Withdraw", "Balance", "Transfer", "Mortgage Calculator", "Entertainment", "Exit"]


                        # Show menu for selecting what to do with account
                        while show_menu_4 == true

                            action = prompt.select("What would you like to do with this account?", choices)

                            #Loop through to get each option out from the action input
                            if action == "Deposite"
                                
                                puts "Please enter the amount: "
                                amount = gets.chomp
                                #Get deposite been calculated in deposite method and return the amount 
                                account.deposite(amount.to_i)
                                puts "Thank you, we deposited $#{amount} to your #{account.getName}, your new balance is $#{account.getBalance}"

                            elsif action == "Withdraw"
                                
                                puts "Please enter the amount:"
                                amount = gets.chomp
                                #Get withdraw been calculated in withdraw method and return the amount
                                account.withdraw(amount.to_i)
                                puts "Thank you, we have withdrawn $#{amount} from your #{account.getName}, your new balance is $#{account.getBalance}"

                            elsif action == "Balance"

                                puts "Your balance for #{account.getName} is $#{account.getBalance}"
                            
                            elsif action == "Transfer"
                                
                                # Get result from the loop in transfer method and return the answer
                                transfer

                            elsif action == "Mortgage Calculator"

                                #Get mortgage calculator from action. 
                                mortgage_calculator
                            
                            elsif action == "Entertainment"

                                # Ask the user where they want to go. Usee the query directly on the Google Places API
                                puts "Let's have some fun... what are you looking for ?"
                                query = gets.chomp

                                # Call the Google Places API with query we got from user
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
                                break
                              
                            else
                                puts "Sorry thats not a valid action!"
                            end

                            # Finally, ask if there is anything else to do

                            action = prompt.select("Would you like to do anything else ?", ["Yes","No"])

                            if action != "Yes"
                                puts "Thank you for using Bank Smart, have a great day!"
                                show_menu_1 = true
                                show_menu_2 = true
                                show_menu_3 = false
                                show_menu_4 = false
                            end
                        end
                    else
                        puts "Sorry, that is not a valid account!"
                        break
                    end
                    

                end

            #if length of the array no greater than 0, then below msg will print out
            else
                puts "Sorry you dont have any accounts!"
                break
            end

        #User name not exits , then print wrong input. 
        else
            puts "Sorry #{username}, wrong input! " 
        end
    end


    
end