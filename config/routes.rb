Rails.application.routes.draw do
  resources :decisions
  resources :choices
  resources :users
  resources :regions
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
