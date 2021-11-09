Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get '/home', to:"home#index"
  #ingresar calorias
  get '/calories/new', to:"calories#new"
  post '/calories', to:"calories#create"
end
