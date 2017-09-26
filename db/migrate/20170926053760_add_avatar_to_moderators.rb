class AddAvatarToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :avatar, :string
  end
end
