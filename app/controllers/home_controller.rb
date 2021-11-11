class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        id_user = current_user.id
        @user = User.find(id_user)
        
        @calorierender = Calorie.where(user_id: id_user).order(updated_at: :desc).paginate(page: params[:page])

        
    end
end
