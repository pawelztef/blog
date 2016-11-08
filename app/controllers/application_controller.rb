class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def resolve_layout
    case action_name
    when 'index'
      'application_front_index'
    when 'show'
      'application_front_show'
    else
      'application'
    end
  end
end
