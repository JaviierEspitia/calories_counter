class UserMailer < ApplicationMailer

    def graph_subject(email, id_user)
        @id_user = id_user
        @user = User.find(id_user)
        puts "mm email de desde el subjetc #{email}"
        mail to: email, subject: "Graph"
    end
end