Rails.application.routes.draw do
  resources :manufacturer
  root "manufacturer#index"
end
