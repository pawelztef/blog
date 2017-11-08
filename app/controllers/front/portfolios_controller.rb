class Front::PortfoliosController < Front::ApplicationController
  layout 'front_end'

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end
