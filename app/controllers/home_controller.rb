class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        id_user = current_user.id
        @user = User.find(id_user)

        @start_date = params[:start].try(:to_date) || 30.days.ago.to_date #si el parametro no es nulo invoca a to_date
        @end_date = params[:end].try(:to_date) || Date.current

        range = (@start_date..@end_date)

        
        @calorierender = Calorie.where(user_id: id_user, day: range).order(updated_at: :desc).paginate(page: params[:page])

        @calories = Calorie.where(user_id: id_user, day: range).group(:kind).group(:day).sum(:quantity_calories)
    
        puts "Star: #{params[:start]}"
        puts "End #{params[:end]}"
    end
end
