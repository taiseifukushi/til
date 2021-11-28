# myapp.rb
require 'sinatra'

# bundle exec ruby myapp.rb でサーバーを起動
# http://localhost:4567/ にアクセスする

get '/' do
  'Hello world!'
end

get '/about' do
  'This is about page!'
end
