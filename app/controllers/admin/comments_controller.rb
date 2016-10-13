class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.where(status: to_bool(params[:status]))
  end

  def update
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to admin_comments_url, notice: "Comment deleted succesfully"
  end
end
