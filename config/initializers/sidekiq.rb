# Sidekiq.configure_server do |config|
#   if Rails.env == 'production'
#     config.redis = { url: ENV['REDISTOGO_URL'] }
#   else
#     config.redis = { url: 'redis://localhost:6379/0' }
#   end

#   database_url = ENV['DATABASE_URL']
#   if database_url
#     ENV['DATABASE_URL'] = "#{database_url}?pool=25"
#     ActiveRecord::Base.establish_connection
#   end
# end
# ----

Sidekiq.configure_server do |config|
  if ENV.has_key?('REDISTOGO_URL')
    config.redis = {url: ENV['REDISTOGO_URL']}
  end

  Rails.logger.info "connecting to redis server at #{config.redis}"
  Rails.application.config.after_initialize do
    ActiveRecord::Base.connection_pool.disconnect!

    ActiveSupport.on_load(:active_record) do
      config = Rails.application.config.database_configuration[Rails.env]
      config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
      config['pool']              = ENV['SIDEKIQ_DB_POOL'] || 25
      ActiveRecord::Base.establish_connection(config)
    end
  end
end

Sidekiq.configure_client do |config|
  if ENV.has_key?('REDISTOGO_URL')
    config.redis = {url: ENV['REDISTOGO_URL']}
  end

  Rails.logger.info "connecting to redis client at #{config.redis}"
  Rails.application.config.after_initialize do
    ActiveRecord::Base.connection_pool.disconnect!

    ActiveSupport.on_load(:active_record) do
      config = Rails.application.config.database_configuration[Rails.env]
      config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
      config['pool']              = ENV['SIDEKIQ_DB_POOL'] || 25
      ActiveRecord::Base.establish_connection(config)
    end
  end
end
