class LoginController < ApplicationController

  # Logins in a User if email and password match
  # 
  # Receives params as parameters
  def create
	 user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
    	session[:user_id] = user.id
	    flash[:success] = "Welcome!"
	    redirect_to '/user/show'
    else
    	flash[:danger] = 'Wrong username or password'
    	redirect_to root_path
    end
  end

  # Logs out a user by deleting cookie
	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out"
  	    redirect_to root_path
	end

end
