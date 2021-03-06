class Admin::ApplicationController < ApplicationController

  protect_from_forgery with: :exception

  layout 'admin'
  before_action :authorize

  def current_moderator
    @moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
  end

  def authorize
    unless current_moderator
      redirect_to '/login', alert: "Please login to view admin page"
    end 
  end

  def to_bool str
    ActiveRecord::Type::Boolean.new.type_cast_from_user(str)
  end

end
