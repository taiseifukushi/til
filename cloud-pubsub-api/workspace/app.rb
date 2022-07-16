require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/namespace'       # http://sinatrarb.com/contrib/namespace
require 'sinatra/json'            # http://sinatrarb.com/contrib/json.html
require 'sinatra/config_file'     # http://sinatrarb.com/contrib/config_file
require 'google/cloud/pubsub/v1'
if Sinatra::Base.environment == :development
  require 'pry'
  require 'dotenv'
  Dotenv.load
end

class App < Sinatra::Base
  register Sinatra::Namespace
  configure :development do
    register Sinatra::Reloader
    register Sinatra::ConfigFile
  end
  config_file './local_config.yml'

  # CORS設定
  # before do
  #   response.headers['Access-Control-Allow-Origin'] = '*'
  # end

  get '/' do
    'Hello World!'
  end

  # ==========
  # 認証
  # https://cloud.google.com/pubsub/docs/authentication?hl=ja
  # https://googleapis.dev/ruby/google-cloud-pubsub/latest/file.AUTHENTICATION.html#creating-a-service-account

  # Google::Cloud::PubSub.configure do |config|
  #   config.project_id  = "my-project-id"
  #   config.credentials = "path/to/keyfile.json"
  # end
  namespace '/api' do
    get '/' do
      json test_key: 'test_val'
    end
    get '/env' do
      json({
             # test_key1: ENV['PUBSUB_PROJECT'],
             test_key1: settings.service_account_info['pubsub_project'],
             test_key2: settings.service_account_info['pubsub_credentials']
           })
    end
  end
end
