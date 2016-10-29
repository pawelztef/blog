class AddColumnToSettings < ActiveRecord::Migration
  def up 
    add_column :settings, :site_phrase, :string
  end
  def down 
    remove_column :settings, :site_phrase
  end
end
