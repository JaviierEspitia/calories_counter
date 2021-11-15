class GraphShareController < ApplicationController
    
    def share
    end

    def update
        @email_share = params[:email_friend]
        if !@email_share.blank?
            id_user = current_user.id
            @user = User.find(id_user) #usuario donde actualizare el token y hora de envio
            @user.create_reset_digest
            @user.send_graph_email(@email_share, id_user)
            flash[:info] = "Email sent with password reset instructions"
            redirect_to root_url
        else
            flash[:danger] = "Email address not found"
            redirect_to root_url
        end
    end

    def graph
        token = params[:token]#el token que recibo del parametro generado en la url del email enviado
        start_date = 30.days.ago.to_date #si el parametro no es nulo invoca a to_date
        end_date = Date.current
        range = (start_date..end_date)
        user = User.find_by(graph_token: "#{token}")
        check_expiration(user.id)
        @calories_share = Calorie.where(user_id: user.id, day: range).group(:kind).group(:day).sum(:quantity_calories)
    end

    def check_expiration(id_user)
        @user = User.find(id_user)
        if @user.graph_token_expired?
            flash[:danger] = "Token expired"
            redirect_to root_url
        end
    end
end