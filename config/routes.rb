Rails.application.routes.draw do
  root to: "root#root"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :recipes, only: [:index, :create, :show]
    resources :annotations, only: [:create, :destroy, :show]
    resources :tags, only: [:show, :index]
    resources :comments, only: [:create]
    resources :users, only: [:show]
    resources :votes, only: [:create, :update]
  end
end
