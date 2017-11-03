class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.boolean :display

      t.timestamps null: false
    end
  end
end
