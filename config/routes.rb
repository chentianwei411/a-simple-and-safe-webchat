Rails.application.routes.draw do
  #部署
  mount ActionCable.server => "/cable"

  resources :chatrooms do
    # 不需要涉及chatroom_users的id，用resource
    resource :chatroom_users, only: [:create, :destroy]
    resources :messages do
      collection do
        delete 'clear', to: 'messages#clear'
      end
    end
  end

  devise_for :users
  root "chatrooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
