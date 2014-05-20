require 'pry'

#def guess_number
  hidden = 46
  puts "Please guess a number between 1 and 1000"
  guess = gets.chomp
  guess = guess.to_i
    if guess > hidden
      puts "Too high"
    elsif guess < hidden
      puts "Too low"
    end

     #else guess_number
     #end
  #end
#end
