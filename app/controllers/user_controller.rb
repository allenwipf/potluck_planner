class UserController < ApplicationController



	def index
		@current_user = User.find(1)
	end


  def create



    @user = User.new(user_params)
 
    if !User.exists?(@user.email) && @user.save

      	session[:user_id] = @user.id
      	flash[:success] = "Welcome to your Potluck Manager!"
      	redirect_to @user

    else

    	session[:error] = "User already exists."
      render 'new'
    end
  end

	def new
		@user = User.new
	end


	def show
		@current_user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end