Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  # mostrar todos los registros de calorias
  get '/home', to:"home#index"
 

  resources :calories 
end
