class ChatSerializer < ActiveModel::Serializer
  attributes :number, :app_token, :messages_count, :created_at, :updated_at

  def app_token
    App.find(object.app_id).token
  end
end
