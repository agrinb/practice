require 'pry'

def errors?(array)
  error = nil
  article_url = array[1]
  article_title = array[0]
  url_attributes = ['http://','.']
  url_attributes.each do |attribute|
    unless article_url.include?(attribute)
     error = true
    end
  end
  error

end

dog = ['a', 'b', 'c']

errors?(dog)
binding.pry
