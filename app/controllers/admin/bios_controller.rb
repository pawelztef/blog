class Admin::BiosController < Admin::ApplicationController

  before_action :set_bio

  def bio_update
    @bio.body = params[:bio_body]
    if @bio.save
      redirect_to admin_moderators_url
    end
  end

private
  def set_bio
    current_moderator.bio.nil? ? current_moderator.build_bio : current_moderator.bio
    @bio = current_moderator.bio
  end

end
