Rails.application.routes.draw do

  root 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'

  get '/gossip/:id', to: 'gossips#show', as: 'gossip'
  get '/user/:id', to: 'users#show', as: 'user'

  get '/welcome/:first_name', to: 'landing_pages#welcome'
end
