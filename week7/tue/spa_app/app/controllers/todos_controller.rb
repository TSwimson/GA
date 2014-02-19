class TodosController < ApplicationController
  def index
    @todos = Todo.all
    respond_to do |f|
      f.html
      f.json { render json: 
        { todos: @todos.as_json(only: [:id, :title, :completed]) } }
    end
  end

  def create
    todo = Todo.Create(todo_params)
    respond_to do |f|
      f.json { render json: todo, only: [:id, :title, :completed]}
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
