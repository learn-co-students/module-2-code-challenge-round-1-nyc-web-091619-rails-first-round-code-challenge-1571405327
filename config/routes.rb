Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create] do
    get '/heroines/heroines_by_power', to: 'heroines#heroines_by_power', as: 'filter_by_power'  
  end
end
