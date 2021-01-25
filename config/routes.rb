Rails.application.routes.draw do

  #resources taken out 
  
  delete "reviews/:id", to: "reviews#destroy"
  post "reviews", to: "reviews#create"
  post "/users", to: "users#create"
  post "/restaurants", to: "restaurants#create"
  post "/login", to: "login#create"
  get "/auto_login", to: "login#auto_login"
  get "/search", to: "restaurants#search"
  get "/get_restaurant", to: "restaurants#get_restaurant"
  post "/restaurants", to: "restaurants#create"
  get "/existing_restaurant",  to: "restaurants#find"
  get "/restaurant_reviews", to: "reviews#restaurant_reviews"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
