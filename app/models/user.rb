class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, :dependent => :destroy
  validates_presence_of :name
  before_create :create_lunch_pool
  after_create :create_chat_room

  def create_lunch_pool
    $redis.set(self.twitter, LunchMate.last(50).to_json)
  end

  def lunch_pool
    return nil unless $redis
    JSON.parse $redis.get self.twitter
  end

end
