class Transaction < ActiveRecord::Base
  attr_accessible :amount, :email, :order_id, :phone_no, :status
end
