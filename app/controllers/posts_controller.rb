class PostsController < ApplicationController
  after_filter :clear_sessions, only: [:show]

  layout :resolve_layout 

  def index
    @book = Book.find_by_display true
    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    else
      @posts = Post.published.page(params[:page]).per(Setting.post_per_page)
    end
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = visitor_comment 
  end
  
private

  def clear_sessions
    [:visitor_errors].each { |k| session.delete(k) }
  end

  def visitor_comment
    if session[:visitor_errors]
      VisitorCommentService.new(session[:visitor_params]).visitor
    else
      Visitor.new(comments: [Comment.new])
    end
  end

  def resolve_layout
    case action_name
    when 'index'
      'application_front_index'
    when 'show'
      'application_front_show'
    else
      'application'
    end
  end
end
