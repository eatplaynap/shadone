Rails.application.routes.draw do
  root "top#index"
  get 'welcome', to: 'welcome#index', as: 'welcome'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'
  delete '/me', to: 'users#destroy'
  resources :practices, only: [:show, :edit, :update, :destroy]
  namespace :api do
    resources :practices, only: [:index, :create]
  end
end

