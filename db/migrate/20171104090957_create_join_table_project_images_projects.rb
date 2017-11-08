class CreateJoinTableProjectImagesProjects < ActiveRecord::Migration
  def change
    create_join_table :projects, :project_images do |t|
      t.index [:project_id, :project_image_id]
      t.index [:project_image_id, :project_id]
    end
  end
end
