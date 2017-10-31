require "sinatra"
require "pry"
require 'csv'

get "/" do
  erb :index
end

get "/articles/new" do
  erb :submit_page
end

get "/thanks" do
  erb :thanks
end

post "/submit_article" do
  title = params['title']
  url = params['url']
  description = params['description']

  CSV.open('articles.csv', 'a') do |csv|
    csv << [title, url, description]
  end

  redirect '/thanks'
end
