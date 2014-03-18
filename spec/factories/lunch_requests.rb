# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lunch_request do
    from 1
    to 2
    from_handle 'jcdavison'
    to_handle 'someonelse'
  end
end
