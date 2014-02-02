if Rails.env == "test"
  $redis = Redis::Namespace.new("lookingtolunchtest", :redis => Redis.new)
elsif Rails.env == "production"
  uri = URI.parse(ENV['REDISTOGO_URL'])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  $redis = Redis::Namespace.new("lookingtolunch", :redis => Redis.new)
end
