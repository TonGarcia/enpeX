# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_goal do
    value "9.99"
    justification "MyString"
    belongs_to ""
    belongs_to ""
  end
end
