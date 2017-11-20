class Front::VisitorsController < Front::ApplicationController
  layout 'front_end'
  before_action :set_front_visitor, only: [:show, :edit, :update, :destroy]

  def new
    @front_visitor = Visitor.new(messages: [Message.new])
  end

  def edit
  end

  def create
    @front_visitor = Visitor.new(front_visitor_params)

    respond_to do |format|
      if @front_visitor.save
        format.html { redirect_to @front_visitor, notice: 'Visitor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @front_visitor.update(front_visitor_params)
        format.html { redirect_to @front_visitor, notice: 'Visitor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_front_visitor
      @front_visitor = Visitor.find(params[:id])
    end

    def front_visitor_params
      params.require(:visitor).permit(:fullname, :email, messages_attributes: Message.attribute_names.map(&:to_sym))
    end
end
