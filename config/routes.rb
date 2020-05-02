Rails.application.routes.draw do
  devise_for :users  
  # get 'home/index'
  # root 'books#edit'

  root to: "home#index"
  resources :home, only: [:index] do
    collection do
      get 'app_description'
      get 'app_question'
    end  
  end  

  resources :users, only: [:show, :edit, :update]
    resources :books do
      collection do
        get 'search'
      end
    end  

    # resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :registers, only: [:index, :new, :create, :show, :edit, :update, :destroy,]
    
    post "books/creat" => "books#creat"
    get "books/:id" => "books#show"
  # root "books#new"  
  # resources :users, only: [:edit, :update]
  # resources :users, only: [:index, :edit, :update]
  # resources :groups, only: [:new, :create, :edit, :update] do
    
  # get    'users/:id'   =>  'users#show'

end
