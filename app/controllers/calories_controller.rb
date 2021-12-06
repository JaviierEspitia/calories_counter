class CaloriesController < ApplicationController
    def new
        @calorie = Calorie.new # crea objeto vacio
    end

    def create
        @calorie = Calorie.new(calories_params)

        if @calorie.save
            flash[:success] = "Registro creado"
            redirect_to '/home'
        else
            flash.now[:danger] = "Error: #{@calorie.errors.full_messages.join(', ')}"
            render 'new'
        end  
    end

    def edit 
        @calorie = Calorie.find(params[:id])
    end

    def show
        @calorie = Calorie.find(params[:id])
    end
    
    def update
        @calorie = Calorie.find(params[:id])
        if @calorie.update(calories_params)
            flash[:success] = "Actualizado"
            redirect_to '/home'
        else
            flash.now[:danger] = "Error: #{@calorie.errors.full_messages.join(', ')}"
            render 'edit'
        end    
    end
    
    def destroy
        @calorie = Calorie.find(params[:id])
        @calorie.destroy
        flash[:success] = "Deleted"
        redirect_to '/home'
    end    

    def mifflin
    end  

    # SELECT SUM(quantity_calories) FROM Calories Where kind="Ingested" GROUP BY day
    # Calorie.where(kind: "Ingested").group(:day).sum(:quantity_calories)
    private
    def calories_params
        params.required(:calorie).permit(:id,:day,:quantity_calories,:kind,:user_id,:comment)
    end
    
end
