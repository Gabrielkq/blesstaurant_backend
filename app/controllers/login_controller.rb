class LoginController < ApplicationController

    def create
        user = User.find_by('lower(username) = ?', params[:username].downcase)
        if user && user.authenticate(params[:password])
            token = encode_token(user.id)
            render json: { token: token, user_id: user.id }
        else
            render json: { errors: [ 'Either the username or the password is incorrect']}  
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "autologin denied"}
        end
    end


end
