Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  get "/users", to: "users#index"
  post "/login", to: "users#login"
  post "/auto_login", to: "users#auto_login"
  post '/password/forgot', to: 'passwords#forgot'
  post '/password/reset', to: 'passwords#reset'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :listings, only: [ :index, :create ]
      resources :categories, only: [:index]
    end
  end
end
