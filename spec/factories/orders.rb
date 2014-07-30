# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    bundle_id 1
    paid_amount "9.99"
    state "MyString"
  end
end
