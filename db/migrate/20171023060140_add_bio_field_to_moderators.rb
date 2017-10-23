class AddBioFieldToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :bio, :text
  end
end
