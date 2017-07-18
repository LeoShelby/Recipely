Rails.application.routes.draw do


  get 'allergens/new'

  get 'invitations/new'

  get 'menus/new'

  get 'events/new'


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  #root 'static_pages#home' #setta "home" come pagina iniziale

  #get 'static_pages/help'  #mappa le richieste per l’URL /static_pages/home alla home action nel StaticPages controller, la route deve rispondere a una GET request
  #get 'static_pages/about'
  #get 'static_pages/contact'
  
  root          'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  #con questo codice (a differenza di quello vecchio sopra) si ottengono le seguenti "variabili" : 
  #help_path -> '/help'
  #help_url -> 'http://www.example.com/help
  #così è possibile ad esempio utilizzare "help_path" nei link delle view
  
  
  get 'signup' => 'users#new'
  
  resources :users  #ottengo tutte le azioni REST per gli users
  
  get 'login' => 'sessions#new'       # azioni per login e logout
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  
  
  resources :account_activations, only: [:edit]  #il controller fa solo la edit, poichè deve solo modificare lo stato dell'utente da non attivo ad attivo e viceversa
  
  resources :password_resets, only: [:new, :create, :edit, :update] 
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :recipes        # only: [:create, :destroy] poichè mi servono tutte
  resources :relationships, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy, :show]
  resources :doneits, only: [:create, :destroy, :show]


  get '/auth/:provider/callback', to: 'sessions#create_with_provider'
  
  get 'notifications/link_through'
  get 'notifications/:id/link_through' => 'notifications#link_through', as: :link_through   #route per l'azione "link_through" del controller Notifications
  get 'notifications' => 'notifications#index'
  
   #per ingredients:
   resources :ingredients, only: [ :show ]
   
   get 'allergens/users/:id', to: 'allergens#new_foruser' , as: :allergens_users
   resources :quantities, only: [:create,:new]
   resources :allergens
   get 'allergens/new/:id' => 'allergens#new'
   post 'allergens/user',to: 'allergens#create_foruser' , as: :create_allergens_users
  # get 'quantities/:id/' => 'quantities#new'

  resources :ratings, only: :update
  
  
  #mi creo una nuova route per l'azione show_all del controllore di badges
  get 'badges/show_all'
  #faccio in modo che tale route prenda come parametro l'id
  get 'badges/:id/show_all' => 'badges#show_all', as: :show_all
  
  get 'user/allergen/:id' => 'allergen#show_all', as: :allergens_all

  resources :events
  resources :menus 
  resources :invitations 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
