Rails.application.routes.draw do
  root 'top#index'
  resources :users, only: [:show, :edit, :destroy]
  resources :practices, only: [:new, :show, :edit, :destroy]
end
