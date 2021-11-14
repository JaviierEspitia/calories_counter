class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        id_user = current_user.id
        @user = User.find(id_user)

        @start_date = params[:start_date].try(:to_date) || 30.days.ago.to_date #si el parametro no es nulo invoca a to_date
        @end_date = params[:end_date].try(:to_date) || Date.current 
        range = (@start_date..@end_date)

        words = params[:words_key]

        # La fecha siempre cargara los ultimos treinta dias puesto que, si viene vacio a la variable
        # start date se le asigna 30 dias anteriores y end se le asigna la fecha actual

        # por tanto si se hace un comentario y no se seleccionan fechas, traera lo que 
        # conside en los ultimos 30 dias con el comentario

        if !words.blank? # si no es blank, nil vacio etc
            #variable que renderiza la grafica
            @calories = Calorie.where(user_id: id_user, day: range).where('comment ILIKE ?', "%#{words}%").group(:kind).group(:day).sum(:quantity_calories)
            #variable que renderiza la tabla
            @calorierender = Calorie.where(user_id: id_user, day: range).where('comment ILIKE ?', "%#{words}%").order(updated_at: :desc).paginate(page: params[:page])
        else
            #si no hay comentario me muestra los ultimos 30 dias
            @calories = Calorie.where(user_id: id_user, day: range).group(:kind).group(:day).sum(:quantity_calories)
            @calorierender = Calorie.where(user_id: id_user, day: range).order(updated_at: :desc).paginate(page: params[:page])
        end    
        
        
    end
end
