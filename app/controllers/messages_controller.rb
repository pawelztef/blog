class MessagesController < ApplicationController
  def new
    @visitor_message = Visitor.new(messages: [Message.new])
  end

  def create
    if visitor.save
      flash[:notice] = "Successfully sent your message"
      respond_to do |format|
        format.html {redirect_to new_message_path} 
        format.js { redirect_to controller: 'posts', action: 'index'}
      end
    else
      @visitor_message = visitor
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  private
  def strong_params
    params.require(:visitor).permit(:fullname, :email, messages_attributes: [:content])
  end

  def visitor
    @visitor ||= VisitorMessageService.new(strong_params).visitor
  end
end
