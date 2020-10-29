Rails.application.routes.draw do

  root 'gossips#index'

  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'landing_pages#welcome'
end
