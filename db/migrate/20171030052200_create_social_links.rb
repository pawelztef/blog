class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :url
      t.string :icon
      t.belongs_to :social_module, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
