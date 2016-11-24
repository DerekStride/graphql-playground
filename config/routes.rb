Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  post '/queries', to: 'queries#create'

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: '/queries'
end
