class Message < ApplicationRecord
  searchkick highlight: [:body]
  belongs_to :chat

  def search_data
    {
      body: body
    }
  end
end
