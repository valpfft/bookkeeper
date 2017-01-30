Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: 'visitors#index'
  resources :users
end
