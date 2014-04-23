class LunchMate < ActiveRecord::Base
  include AASM

  aasm do
    state :available, :intitial => true
    state :presented
    state :invited

    event :present do
      transitions :from => :available, :to => :presented
    end

    event :invite do
      transitions :from => :presented, :to => :invited
    end

    event :provide do
      transitions :from => [:presented, :invited], :to => :available
    end
  end

  validates_presence_of :name, :info, :last_tweet, :handle, :pic
  validates_uniqueness_of :handle

  def self.required_attributes 
    ["name", "info", "last_tweet", "pic", "handle"]
  end

  def self.create_from_handle twitter_handle
    @twitter = TwitterEvent.new
    @twitter = @twitter.client.user(twitter_handle)
    LunchMate.create name: @twitter.name, info: @twitter.description, last_tweet: @twitter.tweet.text, handle: twitter_handle, pic: @twitter.profile_image_url(:bigger).to_s
  end

  def show_lunch_info
    {name: name, handle: handle, pic: pic, info: info, last_tweet: last_tweet}
  end

end
