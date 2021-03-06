Rails.application.routes.draw do
  resources :meals
  resources :schools
  resources :kinds
  resources :ages
  resources :executions
  resources :groups
  post 'auth_user' => 'authentication#authenticate_user'
  devise_for :users

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  # Graphql Routes
  get "/graphql", to: "graphql#execute"
  post "/graphql", to: "graphql#execute"

  resources :ues
  resources :contracts
  resources :audiences
  resources :dishes
  resources :ingredients
  resources :preparations
  resources :presentations
  resources :citizen_rates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home' => 'home#index'

  # API welcome message
  get 'welcome/index'
  get 'welcome', to: 'welcome#index'
  root 'welcome#index'
end
