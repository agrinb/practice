require 'pry'
require 'CSV'



# def create_league
#   league = []
#   CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |row|
#     hash = Hash[row]
#     league << hash
#   end
#   league

# end




def create_league
  league = []
  hash = {}
  CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |row|
    hash = { row[:position] => Hash[row] }

  #
    league << hash
  end
  league
binding.pry
end

puts create_league

# @league = create_league


# @league.each do |player|
#   teams = []
#   if !teams.include?(player[:team])
# binding.pry
#     teams << player[:team]

#     #binding.pry
#   end
# #end
