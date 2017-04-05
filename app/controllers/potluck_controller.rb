class PotluckController < ApplicationController

	def show
		@potluck = Potluck.find(params[:id])
		@items = @potluck.items
	end

	def sorted_items
 	  self.items.sort_by {|item| item.id}.reverse
  end

	def new
		@potluck = Potluck.new(:user_id => session[:user_id])
	end

	def create
		@potluck = Potluck.new(potluck_params)

		if @potluck.save
			flash[:success] = "Potluck saved successfully! Add items below."
			redirect_to @potluck
		else
			render 'new'
		end
	end

	def potluck_params
		params.require(:potluck).permit(:title, :location, :description, :date, :time, :party_size, :user_id)
	end

	def update
		@potluck = Potluck.find(params[:id])
		if @potluck.update_attributes(potluck_params)
			flash.now[:success] = "Update successful!"
		else
			flash.now[:danger] = "Update unsuccessful. Please make sure all fields are filled."
		end
		render 'show'
	end

end