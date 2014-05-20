require 'csv'
require 'pry'

products = []
CSV.foreach('products.csv', headers: true) do |row|
  hash = Hash[row]
  products << hash
end

p products

#   # string = row
#   # @product = []
#   # @product << string
#   # # hash = Hash[string]
#   # # array << hash
#   # # puts array
#   # # p array.class

# end

# p @product[0].class
