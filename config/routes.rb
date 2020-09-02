Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'
  resources :chatrooms, only: [:index] do
    resources :messages, only: [:create]
  end
  get '/construct/', to: 'platforms#construct'

  # get '/others_accounts/', to: 'profiles#others_accounts'
  # get '/your_accounts/', to: 'profiles#your_accounts'
  # get '/requests/', to: 'profiles#requests'

  resources :platforms, only: [:index, :show] do
    resources :build, controller: 'platform_accounts/build', only: [:create]
  end

  resources :platform_accounts, only: [:show, :destroy, :edit, :update] do
    resources :build, controller: 'platform_accounts/build', only: [:show, :update]
  end

  resources :account_seats, only: [:create, :update]
  resources :messages, only: [:new, :create]
  resources :profiles, only: [:edit, :update, :show, :destroy] do
    resources :reviews, only: [ :new, :create ]
    resources :reports, only: [:new, :create]
  end
  resources :reviews, only: [ :destroy]
  resources :reports, only: [:index, :destroy]
  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chatrooms, only: [:index, :show]
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [:index, :create]
  end
  end

end
