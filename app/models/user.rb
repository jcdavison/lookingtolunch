class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :authorizations, :dependent => :destroy
  validates_presence_of :name
  before_create :create_lunch_pool

  def create_lunch_pool
    $redis.set(self.twitter, LunchMate.last(50).to_json)
  end

  def lunch_pool
    return nil unless $redis
    JSON.parse $redis.get self.twitter
  end

end
