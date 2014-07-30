class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
      t.integer :order_id
      t.string :address_line1
      t.string :address_line2
      t.string :pincode
      t.integer :city_id
      t.integer :state_id
      t.string :phone_no

      t.timestamps
    end
  end
end
