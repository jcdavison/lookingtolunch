if Rails.env == "test"
  $redis = Redis::Namespace.new("lookingtolunchtest", :redis => Redis.new)
else
  $redis = Redis::Namespace.new("lookingtolunch", :redis => Redis.new)
end
