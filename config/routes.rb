Rails.application.routes.draw do
  resources :chatrooms do
    # 不需要涉及chatroom_users的id，用resource
    resource :chatroom_users, only: [:create, :destroy]
  end

  devise_for :users
  root "chatrooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
