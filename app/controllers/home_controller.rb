class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        id_user = current_user.id
        @user = User.find(id_user)
    end
end
