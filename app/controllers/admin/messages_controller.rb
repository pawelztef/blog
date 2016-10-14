class Admin::MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc).page params[:page]
  end

  def show
  end

  def update
    @message = Message.find(params[:id])
    @message.update(status: params[:status])
    redirect_to :back, notice: 'Succesfully updated message'
  end

  def destroy
    @message = Message.find(params[:id]).destroy
    redirect_to :back, notice: "Message was successfully deleted"
  end
end
