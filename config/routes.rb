Rails.application.routes.draw do

  
  root "shares#index"

  resources :shares do
  	collection do
  		get 'about', to: 'shares#about', as: :about
  		get 'contact', to: 'shares#contact', as: :contact
  		get 'shares/sector/:sector', to: 'shares#sector', as: :sector
  	end
  	resources :reviews
  end

  
  
end
