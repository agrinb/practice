require 'sinatra'
require "shotgun"
require 'csv'
require 'pry'
require 'will_paginate'
require 'will_paginate/sequel'
require 'sequel/extensions/pagination'
# set :views, File.dirname(__FILE__) + '/views'
# set :public_folder, File.dirname(__FILE__) + '/public'

def create_movies_db(csv)
movies_db = []

CSV.foreach(csv, headers: true, header_converters: :symbol) do |row|
movie = {
  id: row[:id],
  title: row[:title],
  year: row[:year],
  synopsis: row[:synopsis],
  rating: row[:rating],
  genre: row[:genre],
  studio: row[:studio]
  }

  movies_db << movie
  end
  movies_db

end

def find_movie(id)
  movies_db = create_movies_db('movies.csv')
  movie_id = 0
  movies_db.each do |movie|
    movie_id = movie if movie[:id] == id
  end
  movie_id
end



@movies_db = []

get '/movies' do
  @movies_db = create_movies_db('movies.csv')
  @movies_db = @movies_db.sort_by { |hsh| hsh[:title] }

  erb :index
end


get '/movies/:id' do
  @movie = find_movie(params[:id])
  erb :show
end

# get '/movies?page='
# @movie = movies.paginate(:page => params[:page])
# erb :index
end

get '/movies?page='
page = params.fetch "page", 1
per_page = params.fetch "per_page", 3
@posts = Post.order(:id).extension(:pagination).paginate(page.to_i,per_page.to_i)
erb :index
end
