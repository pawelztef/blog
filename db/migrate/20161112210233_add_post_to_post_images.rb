class AddPostToPostImages < ActiveRecord::Migration
  def change
    add_reference :post_images, :post, index: true, foreign_key: true
  end
end
