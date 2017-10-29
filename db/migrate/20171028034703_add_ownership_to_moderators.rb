class AddOwnershipToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :owner, :boolean
  end
end
