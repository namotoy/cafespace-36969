Rails.application.routes.draw do
  get 'cafetypes/index'
  root to: "cafetypes#index"
end
