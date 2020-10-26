Rails.application.routes.draw do

  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
end
