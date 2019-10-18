Rails.application.routes.draw do
  resources :powers, only: [:index, :show] do
    member do
      post :chosen_power
    end
  end 
  resources :heroines, only: [:index, :show, :new, :create]
end
