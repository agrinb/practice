require 'pry'
array = [1,1,2,2,4,4]

uniques = []
array.each do |x|
  if array.include?(x)
    array.delete(x)
  end
  uniques << x
end

puts uniques
Caleb 11:58
require 'sinatra'
require 'CSV'
require 'pry'

def news_method
  news = []
  CSV.foreach("articles.csv", headers: true, header_converters: :symbol) do |row|
    news << row.to_hash
  end
  news
end

########## Test Methods ############

def test_title(title)
  if title == ""
    false
  end
  false
end

def test_url(url)
  if !url.include?("https://")
    false
  end
  false
end

def test_description(description)
  if !description.length >= 20
    false
  end
end

####################################

get '/' do
  @news_method = news_method
  erb :index
end


get '/comment' do
  erb :comment
end


post '/comment' do
  title = params["title"]
  url = params["url"]
  description = params["description"]

if test_url(url) == false
  @error = "Error"
  erb :comment
else
File.open('articles.csv', 'a') do |file|
    file.puts ("#{title},#{url},#{description}")
  end
  redirect '/'
  erb :comment
end
end

