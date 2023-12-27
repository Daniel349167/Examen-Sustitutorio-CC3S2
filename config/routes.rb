Rottenpotatoes::Application.routes.draw do
  resources :movies
  # Add new routes here

  root :to => redirect('/movies')
  get 'movies/:id/similar', to: 'movies#similar', as: 'similar_movies'
end
