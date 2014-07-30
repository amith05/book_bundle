class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :name
      t.string :type
      t.decimal :amount
      t.string :category

      t.timestamps
    end
  end
end
