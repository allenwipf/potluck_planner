class UserController < ApplicationController

	def index
		redirect_to root_path
	end

	def create
    	@user = User.new(user_params)
    	
	    if @user.save
	      	session[:user_id] = @user.id
	      	flash[:success] = "Welcome to your Potluck Manager!"
	      	redirect_to @user
	    else
	      	render 'new'
	    end
  	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end