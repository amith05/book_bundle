class DeliveryAddress < ActiveRecord::Base
  attr_accessible :address_line1, :address_line2, :city_id, :order_id, :phone_no, :pincode, :state_id
end
