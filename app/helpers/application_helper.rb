module ApplicationHelper

  def status_converter(status, truthy: 'Active', falsey: 'Pending')
    if status
      truthy
    else
      falsey
    end
  end

  def comments_approving_links_converter parameters, comment
    if parameters[:status] == 'true' 
      link_to "<span class='fa fa-thumbs-o-down'></span> Un-approve".html_safe, admin_comment_path(comment, status: false), method: :put, class: 'btn btn-xs btn-default'
    else 
      link_to "<span class='fa fa-thumbs-o-up'></span> Approve".html_safe, admin_comment_path(comment, status: true), method: :put, class: 'btn btn-xs btn-defualt'
    end 
  end

  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end

  def double_digit_number n
    '%02d' % n
  end

  def swap_nav_links parameters
    if parameters[:controller] == "reviews"
      link_to "Posts", front_posts_path 
    elsif parameters[:controller] == "posts"
      if parameters[:action] == "show"
        link_to "Posts", front_posts_path 
      else
        set_book_reviews_links
      end
    else
      link_to "Posts", front_posts_path 
    end
  end

  def check_commenting_availability
    return Setting.prevent_commenting?
  end
  def check_tagging_availability
    return Setting.tag_visible?
  end
  def check_reviews_availability
    return Setting.display_reviews?
  end

  def get_number_of_notifications
    Notification.count
  end

  def get_number_of_messages
    Message.unread.count
  end

  def get_number_of_published_posts
    Post.published.count
  end

  def get_number_of_comments approved=false
    approved ? Comment.count : Comment.approved.count
  end

  def build_navigation_link name, path
    content_tag :li, class: 'item' do
      link_to name, path, class: 'link'
    end
  end

  def build_social_links
    links_string = ''
    SocialModule.instance.social_links.each do |link|
      links_string += link_to image_tag(link.icon_url(:xs)), link.url, class: 'link', data: {title: link.url}
    end
    links_string.html_safe
  end

  def set_delete_button
  end

end
