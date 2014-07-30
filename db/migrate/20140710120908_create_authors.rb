class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :firstname
      t.string :middlename
      t.string :lastname

      t.timestamps
    end
  end
end
