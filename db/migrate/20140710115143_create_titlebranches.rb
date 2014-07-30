class CreateTitlebranches < ActiveRecord::Migration
  def change
    create_table :titlebranches do |t|
      t.integer :title_id
      t.integer :branch_id

      t.timestamps
    end
  end
end
