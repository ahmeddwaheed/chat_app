class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :destroy]
  before_action :find_app, only: [:create]

  def index
    chats = Chat.all
    json_response(chats)
  end

  def show
    json_response(@chat)
  end

  def create
    chat_number = NumberGenerator.chat_number(@app.token)
    chat = Chat.new(app_id: @app.id, number: chat_number)
    ChatsCounterWorker.perform_async(@app.id) if chat.save!
    json_response(chat, :created)
  end

  def destroy
    @chat.destroy
  end

  private

  def find_chat
    @chat = Chat.find_by(number: params[:id])
  end

  def find_app
    @app = App.find_by(token: params[:application_id])
  end
end
