class RenidexMessagesWorker
  include Sidekiq::Worker

  def perform(*args)
    Message.reindex
  end
end
