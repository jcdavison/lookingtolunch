Sidekiq.configure_server do |config|
  if Rails.env == 'production'
    config.redis = { url: ENV['REDIS_PROVIDER'] }
  else
    config.redis = { url: 'redis://localhost:6379/0' }
  end

  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end
