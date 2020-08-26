Rails.application.routes.draw do
  devise_for :users
  root to: 'platforms#index'


  get '/blabla/', to: 'platforms#blabla'
  resources :platforms, only: [:index, :show]
    resources :platform_accounts, only: [:show, :destroy, :edit, :update, :new, :create]
  get '/chatrooms/', to: 'chatrooms#index'
  get '/construct/', to: 'platforms#construct'
  resources :platforms, only: [:index, :show] do
    resources :build, controller: 'platform_accounts/build', only: [:create]
  end
  resources :platform_accounts, only: [:show, :destroy, :edit, :update] do
    resources :build, controller: 'platform_accounts/build', only: [:show, :update]
  end

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    resources :chatrooms, only: [:index, :show]
    end
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
