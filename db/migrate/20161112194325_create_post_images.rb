class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :alt, default: ""
      t.string :hint, default: ""
      # paperclip attachment
      t.attachment :file
    end
  end
end
