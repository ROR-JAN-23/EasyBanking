Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  

  get 'index' => "home#index"
  root to:"home#index"

  get '/users/verfied_user/action' ,to: 'users#verfied_user'

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  match '/accounts/:id',     to: 'accounts#new',       via: 'get'

  get '/accounts/balance/action', to: 'accounts#balance'

  post '/accounts/transfer_money/action', to: 'accounts#transfer_money'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
