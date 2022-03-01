Rails.application.routes.draw do
  devise_for :users
  get 'cafetypes/index'
  root to: "cafetypes#index"
  resources :cafetypes
end
