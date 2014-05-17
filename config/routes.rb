Rails.application.routes.draw do

  root 'users#index' # root path
  
  resources :users # Default CRUD routes
  
end
