class PotluckController < ApplicationController

	def show
		@potluck = Potluck.find(params[:id])
		@items = @potluck.items
	end

	def sorted_items
 	   self.items.sort_by {|item| item.id}.reverse
  	end

	def new
		@potluck = Potluck.new
	end

	def create
		
		@potluck = Potluck.new(potluck_params)
		if @potluck.save
			redirect_to @potluck
		else
			# redirecting to same page deletes instance variable @potluck
			render 'new'
			# redirect_to :back
		end
	end

	def potluck_params
		params.require(:potluck).permit(:title, :location, :description, :date, :time,
											:party_size, :user_id)
	end

	def update
		@potluck = Potluck.find(params[:id])
		@potluck.update_attributes(potluck_params)
		render 'show'
	end

end