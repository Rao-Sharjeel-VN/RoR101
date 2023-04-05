class TodosController < ApplicationController
	def new
		# @todo = Todo.new(name: "Rao Sharjeel", description: "This is long text")
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:notice] = "Record was stored successfully"
			redirect_to todo_path(@todo)
		else
			render "new", status: 300

		end
	end


	def show
		@todo = Todo.find(params[:id])
		@i = params[:id]
	end

	private

	def todo_params
		params.require(:todo).permit(:name, :description)
	end
end