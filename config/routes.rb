Rails.application.routes.draw do
  resources :powers
  resources :heroines

  get '/heroines/:id/:powers', to: 'powers#show'
end
