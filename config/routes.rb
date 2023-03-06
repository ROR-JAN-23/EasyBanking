Rails.application.routes.draw do
  devise_for :users
  get 'index' => "home#index"
  root to:"home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
