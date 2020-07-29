class Api::V1::UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end
    
    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(
          name: params[:name],
          username: params[:username],
          password: params[:password],
        )
    
        if user.save
        #   token = encode_token(user.id)
          render json: user 
        # {user: user, token: token}
        else
          render json: {errors: user.errors.full_messages}
        end
    
    end

    

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        
        user = User.find(params[:id])
        # byebug
        user.destroy
    end

    def user_params
        params.require(:user).permit!
    end
end