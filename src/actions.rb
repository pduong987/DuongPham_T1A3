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