class UserController < ApplicationController

	def index
		redirect_to root_path
	end

	# Creates a new User and signs user in. 
	#
	# # Receives params as parameters.
	def create
    	@current_user = User.new(user_params)   	
	    if @current_user.save && @current_user.authenticate(params[:user][:password])
	      	session[:user_id] = @current_user.id
	      	flash[:success] = "Welcome to your Potluck Manager!"
	      	redirect_to @current_user
	    else
	    	@current_user
	      	render 'new'
	    end
  	end

  	# Permits certain User params to be saved to database
	def user_params
		params.require(:user).permit(:name, :email, :password,
													:password_confirmation)
	end
end