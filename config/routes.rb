Rails.application.routes.draw do
  get 'items/create'
  get 'statuses/create'
  get 'genres/create'


  root to: "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :home, only: [:index] do
    collection do
      get 'app_description'
    end  
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'my_page'
      get 'profile_edit'
      get 'my_books_show'
      get 'all_books'
      get 'read_books'
      get 'reading_books'
      get 'will_read_books'
      get 'interested'
      get 'genre_all'
      get 'business'
      get 'business_read'
      get 'self_enlightenment'
      get 'money'
      get 'politics_economy'
      get 'study_skill'
      get 'cooking'
      get 'hobby'
      get 'health'
      get 'sports'
      get 'entertainment'
      get 'parenting'
      get 'novel'
      get 'comic'
      get 'life'
      get 'genre_etc'
      get 'item_all'
      get 'real_book'
      get 'e_book'
      get 'paper_white'
      get 'audio_book'
      get 'item_etc'
    end  
  end

  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    member do
      get 'all_books'
      get 'genre_all'
      get 'business'
      get 'self_enlightenment'
      get 'money'
      get 'politics_economy'
      get 'study_skill'
      get 'cooking'
      get 'hobby'
      get 'health'
      get 'sports'
      get 'entertainment'
      get 'parenting'
      get 'novel'
      get 'comic'
      get 'life'
      get 'genre_etc'
      get 'evaluation_all'
      get 'evaluation_five'
      get 'evaluation_four'
      get 'evaluation_three'
      get 'evaluation_two'
      get 'evaluation_one'
    end
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end  

  post "books/creat" => "books#creat"
  get "books/:id" => "books#show"
  
end
