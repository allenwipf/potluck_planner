class UserController < ApplicationController



	def index

		@current_user = User.find(1)

	end

	







	def create
		@user
	end

	


	def show
		@user = User.new
	end
end
