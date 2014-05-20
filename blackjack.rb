
require 'pry'
#Assign value to each card and add them to array
def convert(hand)
  card_values = []
  hand.each do |card|
    if card == "A"
      card = 11
    elsif card == "K" || card == "Q" || card == "J"
      card = 10

    else
      card = card.to_i

    end
      card_values << card
    end
 card_values
end


#compute SUM by adding all cards in array
def sum(card_values)
  card_values.inject(:+)
end


#check if sum of the array is over 21
def over_limit?(card_values)
  limit = 21
  if sum(card_values) > limit
    true
  else
    false
  end

end



#while true
#if card array contains ACE
#and SUM is greater overlimit
#subtract 10
#delete 11 from ARRAY
def subtract_aces(card_values)
   sum = sum(card_values)
   while card_values.include?(11) && over_limit?(card_values)

        sum -= 10
        card_values.delete_at(card_values.index(11) || card_values.length)
  end
  sum
end

def blackjack(hand)
  card_values = convert(hand)
  sum = subtract_aces(card_values)
end


hand = ["A","A","7"]
puts blackjack(hand)
