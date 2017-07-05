Rails.application.routes.draw do

  root 'static_pages#home' #setta "home" come pagina iniziale

  get 'static_pages/help'  #mappa le richieste per l’URL /static_pages/home alla home action nel StaticPages controller, la route deve rispondere a una GET request
  get 'static_pages/about'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
