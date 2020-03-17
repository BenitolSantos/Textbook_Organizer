Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  #http://localhost:3000/rails/info/routes
  #This can show paths when the server is running
  #https://stackoverflow.com/questions/7465919/rails-link-to-method-geting-when-it-should-delete
  #get show page link_to delete
  resources :users
    delete '/users/:id' => 'users#destroy', as: :delete_user
    get '/users/home', to: 'users#home'
    #post '/users/new', to: 'users#create'
  #resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fb_create'
  
  resources :subjects do
    #get '/subjects/new', to: 'subjects#new'
    #post '/subjects/new', to: 'subjects#create', as: :create_subject
    #get '/subjects/:id/edit', to: 'subjects#edit', as: :edit_textbook
    #post '/subjects/:id/edit', to: 'subjects#update' #patch wasn't needed for this one
    #post '/subjects/:id', to: 'textbooks#create'
    resources :textbooks
      post '/textbooks/new', to: 'textbooks#create', as: :create_textbook
      post '/textbooks/index', to: 'textbooks#result', as: :textbook_result #this was needed because textbooks is linked to subject
      get 'subjects/:id/textbooks', to: 'subjects#textbooks_index'
      get 'subjects/:id/textbooks/:id', to: 'subjects#textbook'
      get 'subjects/:id/textbooks/new', to: 'subjects#textbook_new'
      get 'subjects/textbooks/:id/edit', to: 'subjects#textbook_edit'
      post '/textbooks/:id/edit', to: 'subject#textbook_update'
  end
  

  resources :textbooks
      post '/textbooks/new', to: 'textbooks#create', as: :create_textbook
      post '/textbooks/index', to: 'textbooks#result', as: :textbook_result #this was needed because textbooks is linked to subject
      #get '/textbooks/new', to: 'textbooks#new'
      #post '/textbooks/new', to: 'textbooks#create', as: 'create_textbook'
     get '/textbooks/:id/edit', to: 'textbooks#edit'#, as: :edit_textbook
     post '/textbooks/:id/edit', to: 'textbooks#update' #patch wasn't needed for this one


  #https://guides.rubyonrails.org/routing.html
end
