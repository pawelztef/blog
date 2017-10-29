class ModeratorDecorator < Draper::Decorator
  delegate_all

  def set_avatar
    if object.avatar_url
      h.image_tag object.avatar.url(:profile_backend), class: 'img-resopnsive adm-avatar'
    else
      h.image_tag 'avatar_dummy.jpg', class: 'img-responsive adm-avatar', style: "opacity: .2;"
    end
  end

  def set_profile_img
    if object.avatar
      h.link_to '#', class: 'link' do
        h.image_tag object.avatar.url, class: 'selfie', alt: object.fullname
      end
    end
  end


end
