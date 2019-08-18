class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :destroy]
  before_action :find_chat, only: [:create]

  def index
    messages = Message.all
    json_response(messages)
  end

  def show
    json_response(@message)
  end

  def create
    message_number = NumberGenerator.message_number(@chat.number)
    message = Message.new(chat_id: @chat.id, number: message_number, body: params[:body])
    after_creation_actions if message.save!
    json_response(message, :created)
  end

  def search
    messages = Message.search(params[:query])
    json_response(messages.results)
  end
  
  def destroy
    @message.destroy
  end
  
  def after_creation_actions
    MessagesCounterWorker.perform_async(@chat.id)
    RenidexMessagesWorker.perform_async
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def app
    App.find_by(token: params[:application_id])
  end

  def find_chat
    @chat = Chat.find_by(number: params[:chat_id], app_id: app.id)
  end

  def find_message
    @message = Message.find_by(number: params[:id], chat_id: @chat.id)
  end
end
