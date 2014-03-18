# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "john davison"
    email "john@test.com"
    password "password"
    twitter "jcdavison"
  end
end
