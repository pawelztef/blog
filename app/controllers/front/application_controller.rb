class Front::ApplicationController < ApplicationController

  protect_from_forgery with: :exception
  before_filter :check_redirection
  before_action :set_moderator

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

  private
  def check_redirection
    if !Setting.display_reviews? && request.parameters[:controller] == 'reviews'
      redirect_to posts_path
    end
  end

  def set_moderator
    @moderator = Moderator.where(owner: true).first.try(:decorate)
  end

end
