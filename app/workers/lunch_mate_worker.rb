class LunchMateWorker
  include Sidekiq::Worker

  def perform(name, count)
    p name; p count
  end

end
