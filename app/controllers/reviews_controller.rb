class ReviewsController < ApplicationController

  layout "application_front_show"

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
