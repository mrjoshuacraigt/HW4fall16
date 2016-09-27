#This file is app/controllers/users_controller.rb
class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
    
    def show
        userID = params[:user_id] #retrieve users_id from URI route
        @user = User.find(userID)
        # will render app/views/uers/show.<extension> by default
    end
    
    def index
        @users = User.all
    end
    
    def new
    # default: render 'new' template
    end
    
    def create
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully created."
        #redirect_to movies_path
    end
    
    def edit
        @user = User.find params[:user_id]
    end
    
    def update
        @user = User.find params[:user_id]
        @user.update_attributes!(movie_params)
        flash[:notice] = "#{@user.user_id} was successfully updated."
        #redirect_to movie_path(@movie)
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @user.destroy
        flash[:notice] = "User '#{@user.user_id}' deleted."
        #redirect_to movies_path
    end
    
    
    
    
end