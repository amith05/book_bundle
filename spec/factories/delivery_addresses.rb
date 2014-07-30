# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :delivery_address do
    order_id 1
    address_line1 "MyString"
    address_line2 "MyString"
    pincode "MyString"
    city_id 1
    state_id 1
    phone_no "MyString"
  end
end
