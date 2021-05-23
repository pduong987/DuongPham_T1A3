#Transfer option 
def transfer
    puts "Please enter the amount: "
    amount = gets.chomp
    puts "Are you sure you want to transfer $#{amount} "
    input = gets.chomp
    #Loop to input option.
    if input == "yes" 
        puts "Your $#{amount} has been transferred"
    elsif input == "no"
        puts "Ok, your transfer has been cancelled."
    else
        puts "sorry wrong input"
    end
end

def mortgage_calculator
    #Get information from client
    puts "Hi, Welcome to Mortgage calculator at Bank smart."
    puts "Please answer a few questions below"
    puts "1.How much your total household income ?\n\n"
    income = gets.chomp.to_i
    puts "2.How many dependants children do you have?\n\n"
    dependants = gets.chomp.to_i

    puts "3.Purchase type: Invesment or Home owner?\n\n"
    purchase_type= gets.chomp
    
    #Calculating borrow capacity
    borrowing_capacity = (income * 5) - (100000 * dependants)
    #setting default interest rate to connect to the loop 
    interest_rate = 0.0
    #loop what the house purchase type for inversment or home
    if purchase_type == "home"
        interest_rate = 2.0
    elsif purchase_type == "investment"
        interest_rate = 4.0
    else   
        # WRONG SHOW ERROR
        puts "Sorry, please input 'home' or 'investment' only"
    end
    
    puts "Thank you for all information input. Your borrowing capacity is #{borrowing_capacity} with #{interest_rate}% interest rate."
    
end