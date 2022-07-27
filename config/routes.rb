Rails.application.routes.draw do
  root 'top#index'
  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'tos', to: 'welcome#tos', as: 'tos'
  get 'privacy_policy', to: 'welcome#privacy_policy', as: 'privacy_policy'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :me, only: [:show, :destroy], controller: 'users'
  resources :practice_logs, only: [:show, :edit, :update]
  namespace :api do
    resources :practice_logs, only: [:index, :create]
  end
end

