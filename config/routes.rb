Rails.application.routes.draw do

  get 'user/new'

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
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
