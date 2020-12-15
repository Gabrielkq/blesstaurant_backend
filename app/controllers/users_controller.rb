class UsersController < ApplicationController


    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user.id)
            render json: { token: token, user_id: user.id, username: user.username }
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # def show
    #     user_id = params[:id]
    #     if session_user == user_id.to_i
    #     user = User.find_by(user_id)
    #     render json: user
    #     else
    #     render json: { errors: "token doesn't match user"}
    #     end
    # end



  private

    def user_params
     params.permit(:username, :password)
    end




end
