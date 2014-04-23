class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, :dependent => :destroy
  validates_presence_of :name
  before_create  :make_lunch_mate


  def make_lunch_mate
    LunchMate.create_from_handle self.twitter unless LunchMate.find_by_handle self.twitter
  end

end
