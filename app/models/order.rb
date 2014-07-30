class Order < ActiveRecord::Base
  attr_accessible :bundle_id, :paid_amount, :state, :user_id
end
