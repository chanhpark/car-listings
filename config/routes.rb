Rails.application.routes.draw do
  resources :manufacturers
  root 'manufacturers#index'
end
