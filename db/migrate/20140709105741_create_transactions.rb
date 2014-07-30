class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :email
      t.string :status
      t.integer :order_id
      t.string :phone_no

      t.timestamps
    end
  end
end
