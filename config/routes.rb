Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
