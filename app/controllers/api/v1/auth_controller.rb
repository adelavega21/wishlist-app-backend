  class Api::V1::AuthController < ApplicationController

    def login
      user = User.find_by(username: params[:username])
  
      if user && user.authenticate(params[:password])
        # token = encode_token(user.id)
        render json: user
        # {user: user, token: token}
      else
        render json: {errors: "Incorrect Username or Password!"}
      end
    end
  
    def auto_login
        user = User.find_by(id: request.headers["Authorization"])

        if user
            render json: user
        else
            render json: {errors: "No user found"}
        end
    #   if session_user
    #     render json: session_user
    #   else 
    #     render json: {errors: "User does not exist!"}
    #   end
    end
  end