Rails.application.routes.draw do
  root 'top#index'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :me, only: [:show, :destroy], controller: 'users'
  resources :practice_logs, only: [:show, :edit, :update]
  namespace :api do
    resources :practice_logs, only: [:index, :create]
  end
end

