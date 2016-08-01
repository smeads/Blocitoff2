class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
      if @todo.save
      flash[:notice] = 'Your new TODO was saved'
      else
      flash[:alert] = 'New TODO saved unsuccessfully'
      end
      redirect_to @todo
  end

  def show
    @todo = Todo.find params[:id]
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
