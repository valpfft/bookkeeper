Rails.application.routes.draw do
  resources :categories, except: :new
  resources :spendings, except: :new
  root to: "visitors#index"
  get "statistics", to: "statistics#index"
  devise_for :users
  resources :users, only: [:index, :show, :update, :destroy]
end
