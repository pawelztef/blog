class CreateBooks < ActiveRecord::Migration
  
  def up 
    create_table :books do |t|
      t.string :title
      t.string :author_fname
      t.string :author_lname
      t.string :publisher
      t.string :publish_year
      t.string :isbn
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down 
    drop_table :books
  end
  
end
