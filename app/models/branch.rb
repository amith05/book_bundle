class Branch < ActiveRecord::Base
  attr_accessible :address, :card_id, :category, :city_id, :email, :name, :parent_id, :parent_name, :phone, :subdomain
end
