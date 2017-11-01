class Front::AboutsController < ApplicationController
  layout 'front_end'
  before_action :set_moderator

  def index
  end
  
  private
  def set_moderator
    @moderator = Moderator.where(owner: true).first.try(:decorate)
  end
end
