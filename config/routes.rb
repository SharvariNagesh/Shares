Rails.application.routes.draw do

  resources :reviews
  root "shares#index"
  resources :shares
end
