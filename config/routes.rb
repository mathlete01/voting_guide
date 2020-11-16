Rails.application.routes.draw do
  
  # Decisions
  resources :decisions, only: [:index, :show, :create, :edit, :update]
  delete "decisions", to: "decisions#destroy"
  get "/decisions/:user_id/:choice_id/new", to: "decisions#new", as: "new_decision"

  # Users
  resources :users, only: [:destroy, :create]
  get "signup", to: "users#new", as: "signup"
  
  # Sessions
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  
end
