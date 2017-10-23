class Admin::ModeratorsController < Admin::ApplicationController
  def index
    @moderators = Moderator.all.decorate
  end
  def edit
    @moderator = Moderator.find(params[:id]).decorate
  end
  def update
    @moderator = Moderator.find(params[:id]).decorate
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
    params.require(:moderator).permit(:id, :fullname, :username, :password, :avatar, :bio)
    params.delete(:password) unless moderator_params[:password].present?
    # FIXME error with password params, blocking puma
  end
end
