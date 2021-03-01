class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    todo.save!
    redirect_to todos_url, notice: "TODO「#{todo.name}」を登録しました。"
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_params)
    redirect_to todos_url, notice: "TODO「#{todo.name}」を更新しました。"
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
