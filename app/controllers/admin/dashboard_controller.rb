class Admin::DashboardController < Admin::ApplicationController
  def index
    @posts = Post.last 10
    @comments = Comment.last 3
    @visitors = Visitor.last 5
    @messages = 5
    @notifications = 5
  end
end
