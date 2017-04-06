class ItemController < ApplicationController
	
	def update
		potluck = Potluck.find(params[:id])
		if potluck.authorized_user(session["user_id"])

			params[:item].each do |key, item|

				id = (key.to_i < 1491481669659) ? Item.find(key) : nil 
		
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
	end

	def save(item)
		item = Item.new(item_params(item))
		item.save
		flash[:success] = "Item(s) saved"
	end

	def delete(key, item)
		item = Item.find(key.to_i)
		item.delete
		flash[:danger] = "Item(s) deleted"
	end

	def edit(key, item)
		current_item = Item.find(key.to_i)
		current_item.update_attributes(item_params(item))
		flash[:success] = "Item(s) edited"
	end

	def update_names
		params[:item].each do |key, item|
			current_item = Item.find(key)
			current_item.update(:claimed_by => item[:claimed_by])
		end
		flash[:success] = "Names updated."
		redirect_to(:back)
	end

	def item_params(item)
		item.permit(:name, :category, :amount, :claimed_by, :potluck_id)
	end
	
end