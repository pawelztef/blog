class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status
      t.references :post, index: true, foreign_key: true
      t.references :visitior, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
