class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_admin_project, only: [:show, :edit, :update, :destroy]

  def index
    @admin_projects = Project.all
  end

  def show
  end

  def new
    @admin_project = Project.new
    @admin_project.project_images << ProjectImage.new
  end

  def edit
  end

  def create
    @admin_project = Project.new(admin_project_params)

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

  def update
    respond_to do |format|
      if @admin_project.update(admin_project_params)
        format.html { redirect_to @admin_project, notice: 'Project was successfully updated.' }
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
                                      project_images_attributes: [:title,
                                                                   :image,
                                                                   :description,
                                                                   :main_image,
                                                                   :project_id])
    end
end
