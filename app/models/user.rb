class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, :dependent => :destroy
  validates_presence_of :name
  before_create :create_lunch_pool, :make_lunch_mate

  def create_lunch_pool
    $redis.set(self.twitter, LunchMate.last(50).to_json)
  end

  def lunch_pool
    return nil unless $redis
    JSON.parse $redis.get self.twitter
  end


  def make_lunch_mate
    LunchMate.create_from_handle self.twitter unless LunchMate.find_by_handle self.twitter
  end

end
