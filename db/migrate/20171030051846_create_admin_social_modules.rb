class CreateAdminSocialModules < ActiveRecord::Migration
  def change
    create_table :social_modules do |t|

      t.timestamps null: false
    end
  end
end
