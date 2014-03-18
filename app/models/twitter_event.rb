class TwitterEvent
  attr_accessor :client

  def initialize term = nil
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['LUNCH_TWEETS_KEY']
      config.consumer_secret     = ENV["LUNCH_TWEETS_SECRET"]
      config.access_token        = ENV["LUNCH_TWEETS_ACCESS_TOKEN"]
      config.access_token_secret = ENV["LUNCH_TWEETS_ACCESS_SECRET"]
    end
  end

  def tweet message
    @client.update(message)
  end

end
