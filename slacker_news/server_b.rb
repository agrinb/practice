require 'sinatra'
require "shotgun"
require 'csv'
require 'pry'
require 'redis'
require 'json'

def get_connection
  if ENV.has_key?("REDISCLOUD_URL")
    Redis.new(url: ENV["REDISCLOUD_URL"])
  else
    Redis.new
  end
end

def find_articles
  redis = get_connection
  serialized_articles = redis.lrange("slacker:articles", 0, -1)

  articles = []

  serialized_articles.each do |article|
    articles << JSON.parse(article, symbolize_names: true)
  end

  articles
end


#################################################################

get '/' do
find_articles
build_articles(articles)
  erb :index
end


def build_articles(articles)
@articles = articles
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
      save_article(article_title, article_url)
  end
    redirect '/'
  end
end


def save_article(article_title, article_url)
  article = { url: article_url, title: article_title }

  redis = get_connection
  redis.rpush("slacker:articles", article.to_json)
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











