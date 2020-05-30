Rails.application.routes.draw do
  get 'items/create'

  get 'statuses/create'

  get 'genres/create'

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' } 
  # get 'home/index'
  # root 'books#edit'

  root to: "home#index"

  resources :home, only: [:index] do
    collection do
      get 'app_description'
      get 'app_question'
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
      get 'genre'
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
      get 'item'
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
      get 'genre'
      get 'business'
      get 'self_enlightenment'
      get 'money'
      get 'political_economy'
      get 'study_skill'
      get 'cooking'
      get 'hobby'
      get 'health'
      get 'sports'
      get 'parenting'
      get 'novel'
      get 'comic'
      get 'life'
      get 'genre_ect'
    end
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end  

    # resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    # resources :registers, only: [:index, :new, :create, :show, :edit, :update, :destroy,]

    # ③
    # post "likes/:book_id/create", to: "likes#create", constraints: {book_id: /\d+/}, as: :likes_create
    # post "likes/:book_id/delete", to: "likes#delete", constraints: {book_id: /\d+/}, as: :likes_delete

    # ⑥
    # post "likes/:book_id/create" => "likes#create"
    # post "likes/:book_id/destroy" => "likes#destroy"

    # ⑦
    # post '/books/:book_id/likes' => "likes#create"
    # delete '/books/:book_id/likes' => "likes#destroy"

    # ⑨
    get  'likes/index'
    post '/likes', to: 'likes#create'
    delete '/likes', to: 'likes#destroy'

    post "books/creat" => "books#creat"
    get "books/:id" => "books#show"
  # root "books#new"  
  # resources :users, only: [:edit, :update]
  # resources :users, only: [:index, :edit, :update]
  # resources :groups, only: [:new, :create, :edit, :update] do
    
  # get    'users/:id'   =>  'users#show'

end
