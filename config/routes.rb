Rails.application.routes.draw do

  get "shares" => "shares#index"
  get "shares/:id" => "shares#show", as: "share"
end
