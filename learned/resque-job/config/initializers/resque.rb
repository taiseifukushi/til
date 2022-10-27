require 'resque'
require 'resque/server'
require "redis"

rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'
config_file = rails_root + '/config/resque.yml'
resque_config = YAML::load(ERB.new(IO.read(config_file)).result)
Resque.redis = resque_config[rails_env]
# redis_url           = "redis://localhost:6379"
# Resque.redis        = Redis.new(url: redis_url)
Resque.logger.level = Logger::DEBUG
Resque.logger       = Logger.new(Rails.root.join('log', "resque.log"))
