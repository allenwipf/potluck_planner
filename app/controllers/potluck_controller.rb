class PotluckController < ApplicationController

	# Returns a Potluck object as instants variable if it exists or assigns nil to that variable if it doesn't.
	def show
		@potluck = Potluck.exists?(params[:id]) ? Potluck.find(params[:id]) : nil
	end

	# Sorts items so they appear in order created desc. 
	def sorted_items
 	  self.items.sort_by {|item| item.id}.reverse
 	end

 	# Returns a potluck object and assigns the user_id to the logged in user's id.
	def new
		@potluck = Potluck.new(:user_id => session[:user_id])
	end

	# Creates a new Potluck.
	# 
	# Receives params as parameters.
	def create
		@potluck = Potluck.new(potluck_params)
		if @potluck.save
			@potluck.update_attributes(:slug => @potluck.slug)
			flash[:success] = "Potluck saved successfully! Add items below."
			redirect_to @potluck
		else
			render 'new'
		end
	end

	# Deletes a Potluck if the user is authorized to owns the Potluck.
	# 
	# Receives params as parameters.
	def destroy
	  potluck = Potluck.find(params[:id])
	  if potluck.authorized_user(session["user_id"])
	  	potluck.delete
	  end
	    flash[:danger] = "Potluck deleted."
	    redirect_to("/user/show")
	end

	# Returns a Potluck object by id given in params
	# 
	# Returns Potluck object or nil
	def potluck_view
		@potluck_info = Potluck.find_by_slug(params[:id]) ? Potluck.find_by_slug(params[:id]) : nil
	end


	# Permits certain Potluck params to be saved to database
	def potluck_params
		params.require(:potluck).permit(:title, :location, :description, :date, :time, :party_size, :user_id)
	end

	# Updates a Potluck's information
	# 
	# Receives params as parameters.
	def update
		@potluck = Potluck.find(params[:id])
		if @potluck.authorized_user(session["user_id"])
			@potluck = Potluck.find(params[:id])
			if @potluck.update_attributes(potluck_params)
				@potluck.update_attributes(:slug => @potluck.slug)
				flash.now[:success] = "Update successful!"
			else
				flash.now[:danger] = "Update unsuccessful. Please make sure all fields are filled."
			end
		end
		render 'show'
    end

end