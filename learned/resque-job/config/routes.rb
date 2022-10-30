require 'resque/server'

Rails.application.routes.draw do
  root to: redirect("/resque")
  get 'users/:name', :to => 'users#show'
  mount Resque::Server.new, :at => "/resque"
end
