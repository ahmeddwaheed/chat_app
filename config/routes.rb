Rails.application.routes.draw do
  resources :applications, controller: 'apps', only: [:create, :show, :update, :index, :destroy] do
    resources :chats, only: [:create, :show, :index, :destroy] do
      resources :messages, only: [:create, :show, :index, :destroy]
    end
  end
end
