class Front::AboutsController < Front::ApplicationController
  layout 'front_end'

  def index
   @bio = @moderator.try(:bio)
  end
  
end
