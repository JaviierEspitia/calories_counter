class GraphShareController < ApplicationController
    
    

    def share
    end

    def update
        @email_share = params[:email_friend]
        puts "Mi email enviado #{@email_share}"
        id_user = current_user.id
        @user = User.find(id_user) #usuario donde actualizare el token y hora de envio
        @user.create_reset_digest
        @user.send_graph_email(@email_share, id_user)
        #flash[:info] = "Email sent with password reset instructions"
        redirect_to root_url
        
        #flash.now[:danger] = "Email address not found"
        #render 'new'
        
    end

    def graph
        #id_user = params[:id]# recibo el parametro generado por el email y lo recojo asi
        token = params[:token]
        start_date = 30.days.ago.to_date #si el parametro no es nulo invoca a to_date
        end_date = Date.current
        range = (start_date..end_date)
        id_user = User.find_by(graph_token: "#{token}")
        @calories_share = Calorie.where(user_id: id_user.id, day: range).group(:kind).group(:day).sum(:quantity_calories)
    end
end