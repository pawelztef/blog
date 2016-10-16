class CommentsController < ApplicationController

  def create
    if visitor.save
      flash[:notice] = "Successfuly created new comment"
    else
      flash[:notice] = "There was a problem creating your comment"
    end
    redirect_to :back
  end
  private
  def visitor_comment_params
    params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end

  def visitor
    VisitorCommentService.new(visitor_comment_params).visitor
  end

end
