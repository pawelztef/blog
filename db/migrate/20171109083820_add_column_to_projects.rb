class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :caption, :text
  end
end
