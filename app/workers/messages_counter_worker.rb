class MessagesCounterWorker
  include Sidekiq::Worker

  def perform(chat_id)
    chat = Chat.find(chat_id)
    chat.update!(messages_count: chat.messages_count + 1)
  end
end
