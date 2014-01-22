# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "john davison"
    email "john@test.com"
    password "1234567890"
  end
end
