Rails.application.routes.draw do
  devise_for :users
  resources :charges, only: [:new, :create]
  post "checkout/create", to: "checkout#create"
  resources :checkouts
  resources :posts
  root to: 'posts#index'
end