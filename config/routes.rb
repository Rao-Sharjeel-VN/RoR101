Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get '/about', to: "pages#about"
  resources :todos
  resources :recipes

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

end
