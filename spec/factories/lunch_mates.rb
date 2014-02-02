# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lunch_mate do
    handle "honeybadger"
    name "jd"
    pic "http://someserver.com"
    info "intersting stuff"
    last_tweet "tweet tweet"
  end
end
