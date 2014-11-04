Rails.application.routes.draw do
  resources :users do
  	resources :goals, only: [:index, :create, :new]
  end
  resources :goals, only: [:edit, :update, :destroy, :show]
  resource :session
  
end
