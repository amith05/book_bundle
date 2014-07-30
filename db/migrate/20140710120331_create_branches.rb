class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :category
      t.integer :parent_id
      t.string :parent_name
      t.string :card_id
      t.integer :city_id
      t.string :subdomain

      t.timestamps
    end
  end
end
