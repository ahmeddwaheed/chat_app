class ChatsCounterWorker
  include Sidekiq::Worker

  def perform(app_id)
    app = App.find(app_id)
    app.update!(chats_count: app.chats_count + 1)
  end
end
