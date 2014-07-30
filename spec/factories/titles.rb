# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title do
    title "MyString"
    authorid 1
    publisherid 1
    yearofpublication 1
    isbn "MyString"
    titletype "MyString"
    mrp "9.99"
    author_name "MyString"
    language "MyString"
    category_id 1
    insertdate "2014-07-10 17:10:33"
  end
end
