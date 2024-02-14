Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]

  # get '/restaurants/:restaurant_id/reviews/new'
  # delete '/reviews/:id', to: 'reviews#destroy'
end

# non-crud route keywords
# collection -> we need more than one restaurant (no id)
# member     -> it's specific to one specific restaurant (when we need the ID)


# collection do
#   get :top
# end
# member do
#   get :chef
# end
