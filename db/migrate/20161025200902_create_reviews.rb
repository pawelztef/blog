class CreateReviews < ActiveRecord::Migration
  def up 
    create_table :reviews do |t|
      t.text :content
      t.boolean :draft
      t.references :book, index: true, foren_key: true
      t.timestamps null: false
    end
  end
  def down
    drop_table :reviews
  end
end
