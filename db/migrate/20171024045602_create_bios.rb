class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.text :body
      t.references :moderator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
