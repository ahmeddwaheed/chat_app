class MessageSerializer < ActiveModel::Serializer
  attributes :number, :chat_number, :app_token, :created_at, :updated_at

  def chat_number
    chat.number
  end

  def app_token
    App.find(chat.app_id).token
  end

  def chat
    Chat.find(object.chat_id)
  end
end
