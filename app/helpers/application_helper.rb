module ApplicationHelper

  def status_converter(status, truthy: 'Active', falsey: 'Pending')
    if status
      truthy
    else
      falsey
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
      link_to "Posts", posts_path 
    elsif parameters[:controller] == "posts"
      if parameters[:action] == "show"
        link_to "Posts", posts_path 
      else
        link_to "Books", reviews_path 
      end
    else
      link_to "Posts", posts_path 
    end
  end

  def check_commenting_availability
    return Setting.prevent_commenting?
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

end
