Rails.application.routes.draw do
  devise_for :users
  # get 'registers/index'
  
  root "registers#index"
  resources :users, only: [:edit, :update]
  # resources :users, only: [:index, :edit, :update]

end
