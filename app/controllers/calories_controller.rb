class CaloriesController < ApplicationController
    def new
        @calorie = Calorie.new # crea objeto vacio
    end

    def create
        date_choose = params[:calorie][:day]
        date_choose = date_choose.to_date
        puts "Haber la fecha de hoy #{Date.today} haber mi eleccion #{date_choose}"
        if(date_choose > Date.today)
            flash[:danger] = "Fecha escogida en el futuro"
            redirect_to '/home'
        else
            @calorie = Calorie.create(day: params[:calorie][:day], quantity_calories: params[:calorie][:quantity_calories],
            kind: params[:calorie][:kind], user_id: params[:calorie][:user_id], comment: params[:calorie][:comment])
            flash[:success] = "registro guardado"
            redirect_to '/home'
            
        end
        
        
    end
end
