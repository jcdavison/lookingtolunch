require "twitter"
require 'pry'
require 'pry-debugger'
# need to return replyto tweets for a given location
# then do some magic to to figure out who the most likely people to reply are

class Search
  attr_accessor :tweets

  def initialize term = nil
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['LUNCH_TWITTER_KEY']
      config.consumer_secret     = ENV["LUNCH_TWITTER_SECRET"]
      config.access_token        = ENV["LUNCH_TWITTER_USER_TOKEN"]
      config.access_token_secret = ENV["LUNCH_TWITTER_USER_SECRET"]
    end
    @lat = 37.788245
    @long = -122.417408
    @tweets = @client.search("#{term}", :geocode=> "#{@lat},#{@long},5km" , :result_type=> "recent" , :count=>"300")
  end

end
