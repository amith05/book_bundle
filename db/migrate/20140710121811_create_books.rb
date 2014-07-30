class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bookno
      t.integer :title_id
      t.decimal :mrp, :default => 0
      t.string :status
      t.decimal :location
      t.decimal :origlocation

      t.timestamps
    end
  end
end
