module PostsHelper
  def set_col_no post
    if post.try(:header_image)
      "8"
    else
      "12"
    end
  end
end
