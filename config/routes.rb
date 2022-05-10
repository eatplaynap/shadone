Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :destroy]
  resources :practices, only: [:new, :show, :edit, :destroy]
end
