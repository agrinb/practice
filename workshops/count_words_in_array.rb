require 'pry'

puts "Please enter a long sentence:"
input = gets.chomp
word_array = []
word_array = input.split()
#word_array = ["array1,","array2,"]

# Initialize our hash with nothing in it.
counts = {}



# Loop through each word found in the string...
word_array.each do |word|
  word.sub! ",", ""
  # If the word hasn't been seen before, initialize the count to zero.
  unless counts.has_key?(word)
    counts[word] = 0
  end

  # Increment the count for the word by one.
  counts[word] += 1
end

puts counts.inspect
