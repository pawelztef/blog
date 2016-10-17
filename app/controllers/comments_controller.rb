class CommentsController < ApplicationController

  def create
    if visitor.save
      flash[:notice] = "Successfuly created new comment"
    else
      flash[:notice] = "There was a problem creating your comment"
      set_visitor_sessions 
    end
    redirect_to :back
  end
  private
  def visitor_comment_params
    params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end

  def visitor
    @visitor ||= VisitorCommentService.new(visitor_comment_params).visitor
  end

  def set_visitor_sessions
    session[:visitor_errors] = visitor.errors.full_messages
    session[:visitor_params] = visitor_comment_params
  end
end
