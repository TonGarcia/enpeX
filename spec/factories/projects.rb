# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyString"
    url_video "MyString"
    user nil
  end
end
