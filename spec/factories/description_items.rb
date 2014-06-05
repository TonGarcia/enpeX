# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :description_item do
    title "MyString"
    long_description "MyString"
    project nil
  end
end
