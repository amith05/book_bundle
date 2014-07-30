class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.integer :authorid
      t.integer :publisherid
      t.integer :yearofpublication
      t.string :isbn
      t.string :titletype
      t.decimal :mrp
      t.string :author_name
      t.string :language
      t.integer :category_id
      t.datetime :insertdate

      t.timestamps
    end
  end
end
