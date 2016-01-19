Rails.application.routes.draw do
  root 'collections#index'

  get '/collections' => 'collections#index', as:'all_collections'
  get '/collections/new' => 'collections#new', as:'new_collection'
  post '/collections' => 'collections#create'
  get 'collections/:tag' => 'collections#show', as:'show_collection'

end
