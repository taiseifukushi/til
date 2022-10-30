require 'resque'
require 'resque/server'
require "redis"

Resque.redis = Redis.new(host: 'redis', port: 6379, db: 0)
Resque.logger.level = Logger::DEBUG
Resque.logger       = Logger.new(Rails.root.join('log', "resque.log"))
