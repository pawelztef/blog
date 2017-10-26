class BookDecorator < Draper::Decorator
  delegate_all

  def show_cover
    if true 
      h.icon('book', class: 'cover-mock')
    else 
      h.content_tag(:strong, 'image')
    end
  end

  def display_action_link
    if object.display
      h.content_tag :div, class: 'btn btn-xs btn-default displayed display-btn', id:"#{object.id}" do
        'Displayed'
      end
    else
      h.content_tag :div, class: 'btn btn-xs btn-default display-btn', id:"#{object.id}" do
        'Display'
      end
    end
  end

end
