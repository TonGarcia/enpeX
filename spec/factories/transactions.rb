# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    value 1.5
    user nil
    project nil
  end
end
