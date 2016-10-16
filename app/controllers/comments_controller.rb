class CommentsController < ApplicationController
  def create
    @visitor = Visitor.new(visitor_comment_params).save
    redirect_to :back
  end
  private
  def visitor_comment_params
    params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end
end
