class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_admin_project, only: [:show, :edit, :update, :destroy]

  def index
    @admin_projects = Project.all
  end

  def show
  end

  def new
    @admin_project = Project.new
    @images = ProjectImage.all
  end

  def edit
    @images = ProjectImage.all
  end

  def create
    @images = ProjectImage.all
    @admin_project = Project.new(admin_project_params)
    @admin_project.project_image_ids = params['project_images_ids']
    respond_to do |format|
      if @admin_project.save
        format.html { redirect_to admin_projects_url, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @admin_project }
      else
        format.html { render :new }
        format.json { render json: @admin_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_images
    @images = ProjectImage.all
  end

  def update
    @admin_project.project_image_ids = params['project_images_ids']
    respond_to do |format|
      if @admin_project.update(admin_project_params)
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_project }
      else
        format.html { render :edit }
        format.json { render json: @admin_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_project.destroy
    respond_to do |format|
      format.html { redirect_to admin_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_admin_project
    @admin_project = Project.find(params[:id])
  end

  def admin_project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :display,
                                    :caption,
                                    :project_images_ids,
                                    tag_ids: [],
                                    project_images_attributes: ProjectImage.attribute_names.map(&:to_sym).push(:_destroy).push(:icon_cache))
  end
end
