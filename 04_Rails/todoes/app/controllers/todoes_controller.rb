class TodoesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    todo.save!
    redirect_to todoes_url, notice: "タスク「#{todo.name}」を登録しました。"
  end

  def edit
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
