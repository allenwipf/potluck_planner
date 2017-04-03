class ItemController < ApplicationController


	def update

		
		params[:item].each do |key, item|

	
			current_item = Item.find(key)
			current_item.update_attributes(item_params(item))
		end
	
		redirect_to 'http://localhost:3000/potluck/1'
	end

	def create
		debugger
	end


	def item_params(item)

		item.permit(:name, :category, :amount, :claimed_by)
	end

end