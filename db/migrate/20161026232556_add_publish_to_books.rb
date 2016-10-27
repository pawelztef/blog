class AddPublishToBooks < ActiveRecord::Migration
  def up 
    add_column :books, :publish, :boolean, default: false
  end
  def down 
    remove_column :books, :publish
  end
end
