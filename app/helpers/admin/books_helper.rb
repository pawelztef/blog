module Admin::BooksHelper

  def build_currently_displayed_link book 
    if book
      link_to "#{book.title} - #{book.auth_name}", "#" 
    else
      "none"
    end
  end
  
end
