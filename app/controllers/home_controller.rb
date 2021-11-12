class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        id_user = current_user.id
        @user = User.find(id_user)
        
        @calorierender = Calorie.where(user_id: id_user).order(updated_at: :desc).paginate(page: params[:page])

        @calories = Calorie.where(user_id: id_user).group(:kind).group(:day).sum(:quantity_calories)
    
        puts "Star: #{params[:start]}"
        puts "End #{params[:end]}"
    end
end
