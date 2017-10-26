class AddDetailsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :display_reviews, :boolean
  end
end
