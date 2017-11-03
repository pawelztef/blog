class Front::PostsController < Front::ApplicationController
  after_filter :clear_sessions, only: [:show]

  layout 'front_end'

  def index
    @book = Book.find_by_display true
    if params[:search].present?
      @posts = Post.matching_title(params[:search]).page params[:page]
      tags_filter unless !@posts.empty?
    else
      tags_filter
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


  def tags_filter
    if params[:tag]
      @posts = Post.filter_by_tags(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    else
      @posts = Post.published.page(params[:page]).per(Setting.post_per_page)
    end
  end
end
