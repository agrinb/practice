require 'pry'

#def guess_number
  hidden = 46
  puts "Please guess a number between 1 and 1000"
  guess = gets.chomp
  guess = guess.to_i
  if hidden == guess
    puts "You are correct"
  end
  binding.pry
    if guess > hidden
      puts "Too high"
    else
      puts "Too low"
    end

     #else guess_number
     #end
  end
#end
