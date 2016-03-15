Rails.application.routes.draw do

  root "shares#index"
  resources :shares
end
