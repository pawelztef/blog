class ChangeColumnNameInBooks < ActiveRecord::Migration
  def up 
    rename_column :books, :publish, :display
  end
  def down  
    rename_column :books, :display, :publish
  end
end
