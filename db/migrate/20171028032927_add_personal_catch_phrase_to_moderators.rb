class AddPersonalCatchPhraseToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :catchphrase, :text
  end
end
