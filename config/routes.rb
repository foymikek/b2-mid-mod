Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#studios
  # get "/studios", to: "studios#index"
  resources :studios, only: [:index]

#movies
  resources :movies, only: [:show]
  # get "/movies/:id/", to: "movies#show"
end
