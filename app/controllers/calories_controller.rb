class CaloriesController < ApplicationController
    def new
        @calorie = Calorie.new # crea objeto vacio
    end

    def create
        date_today = DateTime.now.strftime('%Y-%m-%d')
        date_choose = params[:calorie][:day]
        if(date_choose > date_today)
            flash[:danger] = "Fecha escogida en el futuro"
            redirect_to '/home'
        else
            @calorie = Calorie.create(day: params[:calorie][:day], quantity_calories: params[:calorie][:quantity_calories],
            kind: params[:calorie][:kind], user_id: params[:calorie][:user_id], comment: params[:calorie][:comment])
            render json: @calorie
            flash[:success] = "registro guardado"
        end
        
        
    end
end
