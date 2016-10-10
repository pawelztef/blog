class Admin::SessionsController < Admin::ApplicationController
  before_action :authorize, except: [:new, :create]
  def new
  end

  def create
    @moderator = Moderator.find_by(username: params[:username])
    puts @moderator.authenticate(params[:password])
  end

  def destroy
  end
end 
