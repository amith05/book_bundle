class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :bundle_id
      t.decimal :paid_amount
      t.string :state

      t.timestamps
    end
  end
end
