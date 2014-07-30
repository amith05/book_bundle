class CreateTitlelanguages < ActiveRecord::Migration
  def change
    create_table :titlelanguages do |t|
      t.integer :title_id
      t.integer :language_id

      t.timestamps
    end
  end
end
