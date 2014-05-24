require 'sinatra'
require "shotgun"
require 'csv'
require 'pry'
# set :views, File.dirname(__FILE__) + '/views'
# set :public_folder, File.dirname(__FILE__) + '/public'





def create_league(csv)
  league = []
  CSV.foreach(csv, headers: true, header_converters: :symbol) do |row|
    hash = Hash[row]
    league << hash
  end
  league

end

# league.each do |x|
#   puts "#{x["first_name"]}  #{x["last_name"]}-----------" if x["team"] == "Jetson Jets"
# end

@league = []

get '/' do
  @league = create_league('lackp_starting_rosters.csv')
  @teams = []
  @league.each do |player|
  if !@teams.include?(player[:team])
    @teams << player[:team]
  end
  end
  @positions = []
  @league.each do |player|
    if !@positions.include?(player[:position])
      @positions << player[:position]
    end
  end
  erb :index
end

get '/teams/:team' do
  @league = create_league('lackp_starting_rosters.csv')
  @team = []
  @league.each do |player|
    if player[:team] == params[:team]
      @team << player

    end

  end
  erb :teams
end

get '/positions/:position' do
  @league = create_league('lackp_starting_rosters.csv')
  @players = []
  @league.each do |player|
    if player[:position] == params[:position]
      @players << player
    end
  end
  erb :position
end



# get '/team/:team' do
# league = create_league(lackp_starting_rosters.csv)
# @team = league.each do |player|
#         player
#  end
# end


# @teams = ["Simpson Slammers", "Jetson Jets", "Flinestone Fire"
# "Griffin Goats"]

# get '/teams/:team' do

#   @team = params[:team]
#   # The :task_name is available in our params hash
#   erb :'teams/:teams'
# end






# get '/contacts/:email' do
#   @contacts = load_contacts
#   @contact = @contacts.find do |contact|
#     contact[:email] == params[:email]
#   end
# end




# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
