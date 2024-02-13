Rails.application.routes.draw do
  # HTTP_VERB '/path', to: 'controller#action', as: :prefix
  # a prefix ONLY refers to the path, NOT the verb as well
  # CRUD Routes

  # Read All
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create
  # we need a page for a restaurant form (HTML view)
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # a place to receive the form information (instance creation)
  post '/restaurants', to: 'restaurants#create'

  # Read One
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  patch '/restaurants/:id', to: 'restaurants#update'

  # Delete/Destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'
end
