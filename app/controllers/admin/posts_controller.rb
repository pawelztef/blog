class Admin::PostsController < Admin::ApplicationController
  respond_to :json

  def index
    if params[:search].present?
      @posts = Post.matching_title_or_content(params[:search]).page params[:page]
    else
      @posts = Post.all.order(id: :desc).page params[:page]
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.moderator_id = current_moderator.id
    if @post.save
      redirect_to admin_posts_url, notice: 'Post was successfully created.'
    else
      flash[:alert] = 'There was a problem while creating a post.'
      render 'new'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    if Post.find(params[:id]).update_attributes(post_params)
      redirect_to admin_posts_url, notice: 'Post was sucessfully updated'
    else
      flash[:alert] = 'There was a problem while updating a post'
      render 'new'
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :back, notice: ''
  end
  private
  def post_params
    params.require(:post).permit(:id, :postimage, :title, :content, :publish, tag_ids: [])
  end
end
