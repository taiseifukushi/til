require 'sinatra'
require "sinatra/reloader"
require "google/cloud/pubsub/v1"

# before do
#   response.headers['Access-Control-Allow-Origin'] = '*'
# end

get '/' do
  'Hello World!'
end

# 認証
# https://cloud.google.com/pubsub/docs/authentication?hl=ja
