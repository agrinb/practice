#require 'sinatra'
require 'csv'

@league

CSV.foreach('lackp_starting_rosters.csv', headers: true, :header_converters => :symbol ) do |row|
  @league = []
  hash = Hash[row]
  @league << hash
end

#  @league.each do |player|
#   puts player[:team]
# end
