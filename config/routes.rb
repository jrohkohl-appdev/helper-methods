Rails.application.routes.draw do
  #get "/", controller: "movies", action: "index" 
  #get "/" => "movies#index"

  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies #movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie
          
  # READ
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show", as: :movie #movie_path() (expects an argument for :id)
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path() (expects an argument for id)
  
  # DELETE 
  delete "/movies/:id" => "movies#destroy"

  #------------------------------


  # Routes for the Director resource:  

  # CREATE
  get "/directors/new" => "directors#new", as: :new_director
  post "/directors" => "directors#create", as: :directors
  

  # READ
  get "/directors" => "directors#index"
  get "/directors/:id" => "directors#show", as: :director

  # UPDATE
  patch "/directors/:id" => "directors#update"
  get "/directors/:id/edit" => "directors#edit", as: :edit_director

  # DELETE 
  delete "/directors/:id" => "directors#destroy"

end