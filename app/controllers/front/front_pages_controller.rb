class FrontPagesController < Front::ApplicationController

  layout 'front_end'
  before_action :set_moderator
  
  def profile
  end

  def resume
    @bio_text = @moderator.bio.try(:body)
  end

  private
  def set_moderator
    @moderator = Moderator.where(owner: true).first.decorate
  end

end
