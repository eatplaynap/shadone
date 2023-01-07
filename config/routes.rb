Rails.application.routes.draw do
  root 'top#index'
  get 'welcome', to: 'welcome#index'
  get 'tos', to: 'welcome#tos'
  get 'privacy_policy', to: 'welcome#privacy_policy'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :me, only: [:destroy], controller: 'users'
  resources :practice_logs, only: [:show, :update]
  namespace :api do
    resources :practice_logs, only: [:index, :create, :show]
    resources :users, only:[:show]
  end
end
