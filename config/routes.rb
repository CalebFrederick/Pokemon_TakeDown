Rails.application.routes.draw do

  get '/takedown/:pokemon' => 'takedown#take_down'

  get '/type/:type' => 'type#type'

  get '/all_pokemon/' => 'all_pokemon#pokemon'

  get '/pokemon/:id' => 'pokemon#show'

  post '/pokemon/' => 'pokemon#create'

  patch '/pokemon/:id' => 'pokemon#update'

  post '/trainer' => "trainers#create"

  delete '/pokemon/:id' => "pokemon#destroy"

  get '/pokemon' => "pokemon#index"

  post '/sessions' => "sessions#create"

  # get 'takedown/:id' => 'takedown#sprite'

end
