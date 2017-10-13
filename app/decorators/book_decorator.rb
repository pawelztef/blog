class BookDecorator < Draper::Decorator
  delegate_all

  def show_cover
    if true 
      h.icon('book', class: 'cover-mock')
    else 
      h.content_tag(:strong, 'image')
    end
  end

end
