class LunchMate < ActiveRecord::Base
  validates_presence_of :name, :info, :last_tweet, :handle, :pic
  validates_uniqueness_of :handle

  def self.required_attributes 
    ["name", "info", "last_tweet", "pic", "handle"]
  end

end
