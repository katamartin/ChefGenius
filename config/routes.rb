Rails.application.routes.draw do
  root to: "root#root"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :recipes, only: [:index, :create, :show]
    resources :annotations, only: [:create, :destroy, :show]
    resources :tags, only: [:create]
    get 'api/tags/:label', to: 'tags#show'
  end
end
