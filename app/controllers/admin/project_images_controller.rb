class Admin::ProjectImagesController < Admin::ApplicationController
  before_action :set_admin_project_image, only: [:show, :edit, :update, :destroy]

  def index
    @admin_project_images = ProjectImage.all
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @admin_project_image = ProjectImage.new
  end

  def edit
  end

  def create
    @admin_project_image = ProjectImage.create(admin_project_image_params)
  end

  def update
    respond_to do |format|
      if @admin_project_image.update(admin_project_image_params)
        format.html { redirect_to @admin_project_image, notice: 'Project image was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @admin_project_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_project_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_project_images_url, notice: 'Project image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    if params[:project_images_ids]
      ProjectImage.destroy(params[:project_images_ids])
      redirect_to admin_project_images_url, notice: 'Images was successfully destroyed.'
    else
      redirect_to admin_project_images_url
    end
  end

  private
  def set_admin_project_image
    @admin_project_image = ProjectImage.find(params[:id])
  end

  def admin_project_image_params
    params.require(:project_image).permit(:image, :title, :description)
  end
end
