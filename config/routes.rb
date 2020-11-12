Rails.application.routes.draw do
  resources :categories
  resources :decisions, except: :new
  resources :choices
  resources :users
  resources :regions
  resources :cities

  get "/decisions/:user_id/:choice_id/new", to: "decisions#new", as: "new_decision"

  get "signup", to: "users#new", as: "signup"

end
