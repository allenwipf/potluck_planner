class ItemController < ApplicationController
	def update
		potluck = Potluck.find(params[:id])
		if potluck.authorized_user(session["user_id"])

			params[:item].each do |key, item|
				if  key.to_i < 1491481669659
					id = Item.find(key)
				end

				if item[:delete] == "1" && id != nil
					delete(key, item)
				elsif id != nil
					edit(key, item)
				elsif id == nil && !item[:name].blank?
					save(item)
				end
			end
		end
		redirect_to(:back)
		flash[:success] = "Items updated"
	end

	def save(item)
		item = Item.new(item_params(item))
		item.save
	end

	def delete(key, item)
		item = Item.find(key.to_i)
		item.delete
	end

	def edit(key, item)
		current_item = Item.find(key.to_i)
		current_item.update_attributes(item_params(item))
	end

	def update_names
		params.each do |key, item|
			if item.key?(:id)
				current_item = Item.find(item[:id].to_i)
				current_item.update_attributes(item_params(item))
			end
		end
		redirect_to(:back)
	end


	def item_params(item)
		item.permit(:name, :category, :amount, :claimed_by, :potluck_id)
	end
	
end