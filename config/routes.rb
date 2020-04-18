Rails.application.routes.draw do
  devise_for :users
  
  # get 'registers/index'
  
  root "registers#index"
  resources :users, only: [:show, :edit, :update]
    resources :books do
      collection do
        get 'search'
      end
    end  

    # resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :registers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    
    post "books/creat" => "books#creat"
    get "books/:id" => "books#show"
  # root "books#new"  
  # resources :users, only: [:edit, :update]
  # resources :users, only: [:index, :edit, :update]
  # resources :groups, only: [:new, :create, :edit, :update] do
    
  # get    'users/:id'   =>  'users#show'

end
