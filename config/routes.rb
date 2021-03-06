Rails.application.routes.draw do
  root to: "root#root"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    get '/recipes/search', to: 'recipes#search'
    resources :recipes, only: [:index, :create, :show, :destroy]
    resources :annotations, only: [:create, :destroy, :show]
    resources :tags, only: [:show, :index]
    resources :comments, only: [:create]
    resources :users, only: [:show]
    resources :votes, only: [:create, :update, :destroy]
    resources :images, only: [:create, :show]
  end
end
