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

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			flash[:notice] = "Todo updated successfully"
			redirect_to todo_path(@todo)
		else
			render "edit"
		end

	def index
		# @todos = Todo.find(8)
		# @todos = Todo.
	end

	def destroy
		# binding.pry
		@todo = Todo.find(params[:id])
		@todo.destroy
		flash[:notice] = "Todo was deleted"
		redirect_to todos_path
	end


	end

	private

	def todo_params
		params.require(:todo).permit(:name, :description)
	end
end