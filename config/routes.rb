Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#studios
  # get "/studios", to: "studios#index"
  resources :studios, only: [:index]

#movies
  resources :movies, only: [:show]
  # get "/movies/:id/", to: "movies#show"

#movie_actors
  post "movies/:movie_id/actors", to: "movie_actors#create"
end
