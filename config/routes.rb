Rails.application.routes.draw do
  devise_for :users
  get 'cafetypes/index'
  root to: "cafetypes#index"
  resources :cafetypes do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  
end
