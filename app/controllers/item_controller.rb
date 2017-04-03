class ItemController < ApplicationController


	def update

		params[:item].each do |key, item|


			if current_item = Item.find_by_id(key)
				current_item.update_attributes(item_params(item))
			else 
				current_item = Item.new(item_params(item))
				current_item.save
			end


		end
	
		redirect_to 'http://localhost:3000/potluck/1'
	end

	def create
	
	end


	def item_params(item)
		item.permit(:name, :category, :amount, :claimed_by, :potluck_id)
	end

end