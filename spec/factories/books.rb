# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    bookno "MyString"
    title_id 1
    mrp "9.99"
    status "MyString"
    location "9.99"
    origlocation "9.99"
  end
end
