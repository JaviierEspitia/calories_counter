Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  # mostrar todos los registros de calorias
  get '/home', to:"home#index"
  # genera rutas editar crear y eliminar para el modelo calorie
  resources :calories
  # vista protegida para compartir mi progreso
  get '/shareprogress' , to:"graph_share#share"
  
end
