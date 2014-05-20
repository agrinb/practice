require 'csv'
require 'pry'

products = []


CSV.foreach('products.csv', headers: true) do |row|
  hash = Hash[row]
  products << hash
end


def print_menu(products)
  products.each_index  do |index|
  puts "#{index + 1}) Add item - $#{sprintf "%.2f", products[index]["retail_price"]} - #{products[index]["name"]}"
  end
  get_input(products)
end


@light_num = 0
@medium_num = 0
@bold_num = 0


def get_input(products)
  coffee = 0
  until coffee == "4"
    puts "Make a selection:"
    coffee = gets.chomp
    if coffee == "1"
      #@light = 1
      how_many(coffee)
    elsif coffee == "2"
      #@medium = 2
      how_many(coffee)

    elsif coffee == "3"
      #@bold = 3
      how_many(coffee)
    else coffee == "4"
        puts "====End===="
        subtotals(products)
        break
    end
  end
end

def how_many(coffee)
    puts "How many?"
    quantity = gets.chomp.to_i
    if coffee == "1"
      @quant[0][5] += quantity
    elsif coffee == "2"
      @medium_num += quantity
    elsif coffee == "3"
      @bold_num += quantity
  end
end

def subtotals(products)
  totals = {}
  totals["light_total"] = @light_num * products[0]["retail_price"].to_f
  totals["medium_total"]= @medium_num * products[1]["retail_price"].to_f
  totals["bold_total"]= @bold_num * products[2]["retail_price"].to_f
  total(totals, products)
end
#subtotals(products)
#subtotals_array = subtotals(products)

def total(products_hash, products)
  total_cost = products_hash["light_total"] + products_hash["medium_total"] + products_hash["bold_total"]
  sale_complete(products_hash, total_cost, products)
end
#puts total({"light_total" => 5, "medium_total" => 7, "bold_total" => 10})

def sale_complete(products_hash, total_cost, products)
  puts "=== SALE COMPLETE ==="
  puts "$#{ products_hash["light_total"]} - #{@light_num} - #{products[0]["name"]}" if @light_num > 0
  puts "$#{ products_hash["medium_total"]} - #{@medium_num} - #{products[1]["name"]}"   if @medium_num > 0
  puts "$#{ products_hash["bold_total"]} - #{@bold_num} - #{products[2]["name"]}"  if @bold_num > 0
  puts ""
  puts "#{total_cost}"
  cash_tendered(products, products_hash, total_cost)
end

@cash_tendered = 0

def cash_tendered(products, products_hash, total_cost)
  puts "What is the amount of tendered?"
  @cash_tendered = gets.chomp.to_f
  calc_change(products, products_hash, total_cost)
end

def calc_change(products, products_hash, total_cost)
     binding.pry
  @change = @cash_tendered - total_cost
  if @change >= 0
    print_receipt
    write_to_log(products)
  else
    abort
  end
end

def print_receipt
  puts "===THANK YOU!==="
  puts ""
  puts "The total change due is $#{sprintf "%.2f", @change}"
  puts ""
  puts "#{Time.now.strftime("%m/%d/%Y %I:%M%p")}"
end

def abort
  puts "Not enough cash. Balance is negative"
end

def write_to_log(products)
  File.open('log.csv', 'a+') do |f|
      f.puts "#{products[0]["SKU"]},#{@light_num}" if @light_num > 0
      f.puts "#{products[1]["SKU"]},#{@medium_num}" if @medium_num > 0
      f.puts "#{products[2]["SKU"]},#{@bold_num}" if @bold_num > 0
  end
end

print_menu(products)





# ===Sale Complete===

# $30.00 - 6 Light
# $15.00 - 2 Medium

# Total: $45.00

#   end
# end

# def create_bill




# def subtotal




#open file
#import menu
#print menu
#if input isn't 4
#take input and translate it into price and store it to variable
#prompt for qunatity
#take quantity and store into a variable
#write name, quantity, and price to variables
#multiply quantity by price
#print summary with cost amd quantity and grand total
#ask for amount tendered and store it
#calculate differece between grand total and amount tendered
#is the difference positive
  #if no, exit program
#if yes print receipt with details
#compile data for CSV
#write to csv



def items(products)
  products.each_index  do |index|
  puts index + 1
  end
end

#   puts products[index]["retail_price"]
#   # products[index]["retail_price"]
# end


# products.each_index  do |index|
#   if products[index]["name"] == "Bold"
#   products[index]["retail_price"]
#   # products[index]["retail_price"]
#   end
# end


# products.each_index do |index|
#   index += 1



# hash_prices = {}
# hash_prices.each do |index price|
#   Hash[index += 1, price ]
# end


# # # def go_up_one
# # #   for
# # #   num = 0



# # # new_hash = Hash[key] = "value"


