require 'sinatra'
require "shotgun"
require 'csv'
require 'pry'

get '/' do
build_articles('articles.csv')
  erb :index
end


def build_articles(articles)
@articles = []
CSV.foreach(articles) do |row|
  @articles << row
 end
 @articles
end

get '/submit' do
  erb :submit
end



post '/new_article' do
  new_article = []
  article_title = params['article_title']
  article_url = params['article_url']
  new_article = [article_title, article_url]
  errors = {}
  merge_url_errors(new_article, errors)
  merge_field_errors(new_article, errors)
  unless errors.empty?
    @errors = errors
    erb :submit
  else
      CSV.open("articles.csv", "a+") do |csv|
        csv << new_article
      end
    redirect '/'
  end
end



def merge_field_errors(new_article, errors)
  if new_article[0] == "" || new_article[1] == ""
    errors.merge!( :fields_error => "Please fill out all the fields")
  end
  errors
end


def merge_url_errors(new_article, errors)
  article_url = new_article[1]
  url_attributes = ['http://','.']
  url_attributes.each do |attribute|

    unless article_url.include?(attribute)
     errors.merge!( :url_error => "Invalid URL" )
    end
  end
  errors
end











