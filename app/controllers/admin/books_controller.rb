class Admin::BooksController < Admin::ApplicationController

  def index
    @books = Book.all
    @displayed = Book.find_by_display true
    
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.create(books_params)
    if @book.save
      redirect_to admin_books_path, notice: 'Review was successfully created.'
    else
      flash[:alert] = 'There was a problem while creating a review.'
      render 'new'
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    if Book.find(params[:id]).update_attributes(books_params)
      redirect_to admin_books_path, notice: 'Review was successfuly updated'
    else
      flash[:alert] = 'There was a problem while updating a review'
      render 'new'
    end
  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy
    redirect_to :back, notice: "Review Deleted"
  end

private
  def books_params
    params.require(:book).permit(:title, :author_fname, :author_lname, :publisher, :publish_year, :isbn)
  end

end
