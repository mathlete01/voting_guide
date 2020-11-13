Rails.application.routes.draw do
  resources :categories
  resources :decisions, except: :new
  resources :choices
  resources :users
  resources :regions
  resources :cities

  get "/decisions/:user_id/:choice_id/new", to: "decisions#new", as: "new_decision"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  delete "decisions", to: "decisions#destroy"
  #delete "users", to: "users#destroy"

end
