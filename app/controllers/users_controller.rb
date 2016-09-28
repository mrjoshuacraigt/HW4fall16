#This file is app/controllers/users_controller.rb
class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
    
    def show
      id = params[:id] #retrieve users_id from URI route
      @user = User.find(id)
      # will render app/views/users/show.<extension> by default
    end
    
    def index
      @users = User.all
    end
    
    def new
        # default: render 'new' template
    end
    
    def create
        if User.exists?(:user_id => user_params[:user_id])
             flash[:notice_user] = "Sorry, this user-id is taken. Try again."
             redirect_to login_path
        else
            User.create_user!(user_params);
            flash[:notice_user] = "Welcome #{user_params[:user_id]}. Your account has been created."
            redirect_to login_path
        end
    end
    
    def edit
        @user = User.find params[:id]
    end
    
    def update
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:notice_user] = "#{@user.user_id} was successfully updated."
        redirect_to user_path
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice_user] = "User '#{@user.user_id}' deleted."
        redirect_to movies_path
    end
    
    
    
    
end