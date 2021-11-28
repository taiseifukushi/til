# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require "pry"

# bundle exec ruby myapp.rb でサーバーを起動
# http://localhost:4567/ にアクセスする

get '/' do
    'Hello world!'
end

get '/about' do
    'This is "about" page!'
end

get '/index' do
    'This is "index" page!'
    @title = "インデックスページ"
    @first_name = "taisei"
    @last_name = "fukushi"
    haml :index
end

get '/index/page' do
    'This is "index/page" page!'
end
