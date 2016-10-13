class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tag_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: "Tags created successfully"
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes tag_params
      redirect_to new_admin_tag_url, notice: 'Successfully updated tag'
    else
      flash[:alert] = "There was a problem updating tag"
      render :edit
    end
  end

  def show
  end

  def destroy
    Tag.destroy(params[:id])
    redirect_to new_admin_tag_url, notice: "Tag was succesfully deleted"
  end
  private
  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
