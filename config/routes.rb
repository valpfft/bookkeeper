Rails.application.routes.draw do
  resources :categories
  resources :spendings
  devise_for :users
  root to: "visitors#index"
  resources :users
  get "statistics", to: "statistics#index"
end
