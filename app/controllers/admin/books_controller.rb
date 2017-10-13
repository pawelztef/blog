class Admin::BooksController < Admin::ApplicationController

  def index
    @books = Book.all.decorate
    @displayed = Book.find_by_display true
    
  end

  def new
    @book = Book.new()
    @book.build_review
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
    @book = Book.find(params[:id])
    if @book.update_attributes(books_params) && @book.show
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
    params.require(:book).permit(:title, :author_fname, :author_lname, :display, :publisher, :publish_year, :isbn, :cover, review_attributes: [:content, :draft])
  end

end
