class Front::ProfilesController < Front::ApplicationController

  layout 'front_end'
  
  def index 
    flash[:notice] = "what's up you great moderator!"
  end
  
end
