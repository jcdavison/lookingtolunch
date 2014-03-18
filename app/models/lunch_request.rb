class LunchRequest < ActiveRecord::Base
  validates_presence_of :from, :to, :from_handle, :to_handle
  before_save :send_notification

  def send_notification
    event = TwitterEvent.new
    message = "Hi {self.to_handle}, {from.handle} is looking to lunch, click here"
    if Rails.env.production?
      event.tweet message
    else
      p message
    end
  end
end
