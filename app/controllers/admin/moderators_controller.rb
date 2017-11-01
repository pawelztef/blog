class Admin::ModeratorsController < Admin::ApplicationController
  def index
    @moderators = Moderator.all.decorate
  end
  def edit
    @moderator = Moderator.find(params[:id]).decorate
    @bio = @moderator.bio.try(:body)
  end
  def update
    @moderator = Moderator.find(params[:id]).decorate
    Moderator.update_all(owner: false) if moderator_params[:owner]
    if @moderator.update(moderator_params)
      flash[:notice] = "Moderator was successfully updated"
      redirect_to(action: 'index') 
    else
      flash[:alert] = "There was a problem updating moderator"
      render 'edit'
    end
  end
  private
  def moderator_params
    params.require(:moderator).permit(:id, :fullname, :username, :password, :avatar, :bio, :password_confirmation, :catchphrase, :owner)
  end
end
