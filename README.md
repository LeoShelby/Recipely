# Recipely


Il laboratorio di Applicazioni Software e Sicurezza Informatica ci ha fornito gli strumenti necessari per realizzare un’applicazione web nella quale sono confluiti gran parte degli insegnamenti del corso accademico triennale.
La nostra idea è nata dalla possibilità di realizzare una piattaforma social , ispirata al modello di Facebook, ove la tematica principale fossero le ricette culinarie : argomento per il quale , il gruppo nutre una grande passione.
I passi da seguire per avviare il server sono :
1. assicurarsi di avere installato Ruby e il framework Rails
2. clonare il repository
3. accedere alla cartella ’Recipely’
4. installare tutte le gemme richieste : bundle install –without production , bundle update
5. avviare le migration : rails db:drop:all , rails db:migrate
6. popolare il database : rails db:seed
7. avviare il server :rails server
