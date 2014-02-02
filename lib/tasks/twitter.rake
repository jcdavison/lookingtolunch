namespace :twitter do
  desc "scrape recent tweets for people"
  task :create => :environment do
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['LUNCH_TWITTER_KEY']
      config.consumer_secret     = ENV["LUNCH_TWITTER_SECRET"]
      config.access_token        = ENV["LUNCH_TWITTER_USER_TOKEN"]
      config.access_token_secret = ENV["LUNCH_TWITTER_USER_SECRET"]
    end
    @lat = 37.788245
    @long = -122.417408
    @tweets = @client.search("", :geocode=> "#{@lat},#{@long},5km" , :result_type=> "recent")
    @tweets.each do |tweet|
      LunchMate.create name: tweet.user.name, handle: tweet.user.screen_name, 
        info: tweet.user.description, last_tweet: tweet.text, pic: tweet.user.profile_image_url.to_s 
    end
  end
end
