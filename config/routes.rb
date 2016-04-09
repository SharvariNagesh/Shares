Rails.application.routes.draw do

  
  root "shares#index"
  resources :shares do
  	resources :reviews
  end
end
