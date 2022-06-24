Rails.application.routes.draw do
  get "welcome", to: "welcome#index", as: "welcome"
  root 'top#index'
  resources :users, only: [:show, :edit, :destroy]
  resources :practices, only: [:new, :show, :edit, :destroy]
  namespace :api do
    resources :practices, only: :create
    resources :practice_calendars, only: :show
  end
end
