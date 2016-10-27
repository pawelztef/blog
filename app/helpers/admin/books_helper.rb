module Admin::BooksHelper

  def build_currently_displayed_link book, id
    if book
      link_to "#{book.title} - #{book.auth_name}", "#", data: {toggle: 'modal', target: id}
    else
      "none"
    end
  end
  
end
