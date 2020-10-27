Rails.application.routes.draw do

  root 'gossips#index'

  resources :gossips
  resources :users

  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'landing_pages#welcome'
end
