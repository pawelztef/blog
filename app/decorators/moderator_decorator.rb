class ModeratorDecorator < Draper::Decorator
  delegate_all

  def set_avatar
    if object.avatar
      h.image_tag object.avatar.url, class: 'adm-avatar'
    else
      h.image_tag 'avatar_dummy.jpg', class: 'adm-avatar'
    end
  end


end
