class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.string :image
      t.string :title
      t.string :description
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
