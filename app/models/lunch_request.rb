class LunchRequest < ActiveRecord::Base
  validates_presence_of :from, :to
end
