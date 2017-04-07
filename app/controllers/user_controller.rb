class UserController < ApplicationController

	def index
		redirect_to root_path
	end

	# Creates a new User and signs user in. 
	#
	# # Receives params as parameters.
	def create
    	@user = User.new(user_params)   	
	    if @user.save && @user.authenticate(params[:user][:password])
	      	session[:user_id] = @user.id
	      	flash[:success] = "Welcome to your Potluck Manager!"
	      	redirect_to @user
	    else
	      	render 'new'
	    end
  	end

  	# Permits certain User params to be saved to database
	def user_params
		params.require(:user).permit(:name, :email, :password,
													:password_confirmation)
	end
end