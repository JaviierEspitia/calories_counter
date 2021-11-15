Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  # mostrar todos los registros de calorias
  get '/home', to:"home#index"
  # genera rutas editar crear y eliminar para el modelo calorie
  resources :calories
  # vista protegida para compartir mi progreso
  get '/shareprogress' , to:"graph_share#share"

  get '/graph_share', to:"graph_share#graph"
  
  patch '/graph_share_token', to: "graph_share#update"

  #funcionalidad extra
  get '/mifflin', to:"calories#mifflin"

end
