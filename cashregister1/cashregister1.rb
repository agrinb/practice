require 'pry'

def cashregister
  #Prompt cashier for amount due
  print 'Amount of the transaction: $'

  #Store amount due in integer
  money_due = gets.chomp
  money_due = money_due.to_f


  #Prompt for cash input
  print 'Cash submitted: $'
  #Store cash input in integer
  cash = gets.chomp
  cash = cash.to_f


  #Determine the time
  time = Time.new

  #Save time in String
  time = time.strftime("%I:%M%p")
  #Calculate the difference
  change = cash - money_due
  # binding.pry
    #if the difference is positive output the amount due and the time
    if change > 0
      puts "Change: $#{sprintf "%.2f", change}"
      puts  "#{time}"

    #if the difference is 0 complete the transaction out put the time
    elsif change == 0
      puts "No Change. Thank you for your business"
      puts  "#{time}"
    #if the difference is negative
      #warn cashier and exit
    else
      puts "Negative Balance!!!"
    end
end


cashregister



