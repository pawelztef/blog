class Admin::ProjectImagesController < Admin::ApplicationController
  before_action :set_admin_project_image, only: [:show, :edit, :update, :destroy]

  def index
    @admin_project_images = ProjectImage.all
  end

  def show
  end

  def new
    @admin_project_image = ProjectImage.new
  end

  def edit
  end

  def create
    @admin_project_image = ProjectImage.new(admin_project_image_params)

    respond_to do |format|
      if @admin_project_image.save
        format.html { redirect_to @admin_project_image, notice: 'Project image was successfully created.' }
        format.json { render :show, status: :created, location: @admin_project_image }
      else
        format.html { render :new }
        format.json { render json: @admin_project_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_project_image.update(admin_project_image_params)
        format.html { redirect_to @admin_project_image, notice: 'Project image was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_project_image }
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

  private
    def set_admin_project_image
      @admin_project_image = ProjectImage.find(params[:id])
    end

    def admin_project_image_params
      params.fetch(:admin_project_image, {})
    end
end
