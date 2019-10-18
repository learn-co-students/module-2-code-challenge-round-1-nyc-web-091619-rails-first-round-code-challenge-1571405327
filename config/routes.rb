Rails.application.routes.draw do
  resources :powers
  resources :heroines do
    collection do
      get 'search'
    end
  end
    


end
