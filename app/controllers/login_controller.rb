class LoginController < ApplicationController

	def create
	  user = User.find_by(:email => params[:email], :password => params[:password])
	  if !user.nil?
	    session[:user_id] = user.id
	    flash[:success] = "You are logged In!"
	    redirect_to '/users/show'
	  else
	    flash[:danger] = "Incorrect email or password"
	    redirect_to '/'
	  end
  end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Successfully logged out"
  		redirect_to root_path
	end
end
