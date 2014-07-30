# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    amount "9.99"
    email "MyString"
    status "MyString"
    order_id 1
    phone_no "MyString"
  end
end
