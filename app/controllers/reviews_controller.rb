class ReviewsController < ApplicationController

  layout "application_front_show"

  def index
    @books = Book.all.decorate
  end

  def show
    @book = Book.find(params[:id]).decorate
    respond_to do |format|
      format.html
      format.js
    end
  end
end
