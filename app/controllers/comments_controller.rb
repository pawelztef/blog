class CommentsController < ApplicationController

  def create
    visitor = Visitor.find_by(email: visitor_comment_params[:email])
    if visitor
      visitor.tap do |v|
        v.comments << Comment.new(visitor_comment_params[:comments_attributes]['0'])
      end
    else
      visitor = Visitor.new(visitor_comment_params)
    end
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
end
