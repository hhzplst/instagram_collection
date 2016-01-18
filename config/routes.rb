Rails.application.routes.draw do
  root 'collections#index'
  resources :collections
end
