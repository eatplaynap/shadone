Rails.application.routes.draw do
  root 'top#index'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :me, only: [:show, :destroy], controller: 'users'
  resources :practices, only: [:show, :edit, :update]
  namespace :api do
    resources :practices, only: [:index, :create]
  end
end

