require 'resque/server'

Rails.application.routes.draw do
  get 'users/:name', :to => 'users#show'
  mount Resque::Server.new, :at => "/resque"
end
