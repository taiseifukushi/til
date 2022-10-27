class UsersController < ApplicationController
  def show
    Resque.enqueue(Mylogger, params[:name])
    render :text => params[:name]
  end
end
