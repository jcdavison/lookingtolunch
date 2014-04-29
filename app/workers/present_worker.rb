class PresentWorker
  include Sidekiq::Worker
  def perform(id)
    lunchmate = LunchMate.find_by_id(id)
    p "performing present!" unless lunchmate.nil?
    lunchmate.send(:present!) unless lunchmate.nil?
  end
end

class ProvideFromAvail
  include Sidekiq::Worker
  def perform(id)
    lunchmate = LunchMate.find_by_id(id)
    p "performing provide_from_avail!, #{id}" unless lunchmate.nil?
    lunchmate.send(:provide_from_avail!) unless lunchmate.nil?
  end
end

class ProvideFromInvited
  include Sidekiq::Worker
  def perform(id)
    lunchmate = LunchMate.find_by_id(id)
    p "performing provide_from_invited!, #{id}" unless lunchmate.nil?
    lunchmate.send(:provide_from_invited!) unless lunchmate.nil?
  end
end
