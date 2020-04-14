Rails.application.routes.draw do
  devise_for :users
  # get 'registers/index'
  
  root "registers#index"
  resources :users, only: [:edit, :update]
    resources :registers, only: [:index, :new, :create, :show, :edit, :update, :delete]
  # resources :users, only: [:index, :edit, :update]
  # resources :groups, only: [:new, :create, :edit, :update] do
    
  
end
