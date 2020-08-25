Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'


  get '/blabla/', to: 'platforms#blabla'
  resources :platforms, only: [:index, :show]
    resources :platform_accounts, only: [:show, :destroy, :edit, :update, :new, :create]
  get '/chatrooms/', to: 'chatroom#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
