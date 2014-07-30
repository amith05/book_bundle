class AddColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :pincode, :string
    add_column :users, :city_id, :integer
    add_column :users, :state_id, :integer
    add_column :users, :phone_no, :string
  end
end
