Rails.application.routes.draw do
  root 'top#index'
  get "welcome", to: "welcome#index", as: "welcome"
  get "auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :edit, :destroy]
  resources :practices, only: [:new, :show, :edit, :update, :destroy]
  namespace :api do
    resources :practices, only: [:index, :create]
  end
end

