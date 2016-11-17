module Admin::TagsHelper
  def create_deletable_button(tag)
    if tag.in_use? 
      link_to '#' do
        content_tag(:span, "Delete", class: "btn btn-xs btn-default disabled")
      end
    else
      link_to admin_tag_path(tag), method: :delete do
        content_tag(:span, "Delete", class: "btn btn-xs btn-default")
      end
    end
  end
end


