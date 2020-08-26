Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'


  get '/blabla/', to: 'platforms#blabla'
  resources :platforms, only: [:index, :show]
    resources :platform_accounts, only: [:show, :destroy, :edit, :update, :new, :create]
  get '/chatrooms/', to: 'chatroom#index'
  get '/construct/', to: 'platforms#construct'
  resources :platforms, only: [:index, :show] do
    resources :build, controller: 'platform_accounts/build', only: [:create]
  end
  resources :platform_accounts, only: [:show, :destroy, :edit, :update] do
    resources :build, controller: 'platform_accounts/build', only: [:show, :update]
  end
end
