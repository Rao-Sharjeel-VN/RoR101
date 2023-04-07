class RecipesController < ApplicationController
	def index
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def edit
		@recipe = Recipe.find(params[:id])
		# redirect_to recipe_path(@recipe)
	end



	def destroy

		@recipe = Recipe.find(params[:id])
		@recipe.destroy

		flash[:notice] = "Record was deleted successfully"
		redirect_to recipes_path
	end

	def update

		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			flash[:notice] = "Record was edited"

			redirect_to recipe_path(@recipe)
		else
			flash[:notice] = "Record was not edited"
			redirect_to recipe_path(@recipe)
		end
	end


	def new
		@recipe = Recipe.new
	end


	def create
		@recipe = Recipe.new(recipe_params)
		print @recipe.chef_id
		if @recipe.save
			flash[:notice] = "Record was stored successfully"
			@recipe.chef_id = @recipe.chef_id

			redirect_to recipes_path
		else
			render "new", status: 300
		end
	end



	private

	def recipe_params
		params.require(:recipe).permit(:name, :description, :chef_id)
	end

end