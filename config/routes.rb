Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  #http://localhost:3000/rails/info/routes
  #This can show paths when the server is running
  #https://stackoverflow.com/questions/7465919/rails-link-to-method-geting-when-it-should-delete
  #get show page link_to delete
  resources :users
    delete '/users/:id' => 'users#destroy', as: :delete_user
    #get '/users/new', to: 'users#new'
    #post '/users/new', to: 'users#create'
  #resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resources :subjects do
    #get '/subjects/new', to: 'subjects#new'
    #post '/subjects/new', to: 'subjects#create'
    #get '/subjects/:id/edit', to: 'subjects#edit', as: :edit_textbook
    #post '/subjects/:id/edit', to: 'subjects#update' #patch wasn't needed for this one
    resources :textbooks
      post '/textbooks/new', to: 'textbooks#create'
    
  get 'subjects/:id/textbooks', to: 'subjects#textbooks_index'
  get 'subjects/:id/textbooks/:id', to: 'subjects#textbook'
  end


  resources :textbooks
      post '/textbooks/new', to: 'textbooks#create'
    
      #get '/textbooks/new', to: 'textbooks#new'
      #post '/textbooks/new', to: 'textbooks#create', as: 'create_textbook'
      #get '/textbooks/:id/edit', to: 'textbooks#edit', as: :edit_textbook
     #post '/textbooks/:id/edit', to: 'textbooks#update' #patch wasn't needed for this one


  #https://guides.rubyonrails.org/routing.html
end
