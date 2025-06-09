Rails.application.routes.draw do
  root "places#index"

  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
