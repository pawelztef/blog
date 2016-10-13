class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
    else
      @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(status: params[:status])
      redirect_to :back, notice: "Comment sucessfully updated"
    else
      redirect_to :back, notice: "There was a problem updating commnet"
    end
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to :back, notice: "Comment deleted succesfully"
  end
end
