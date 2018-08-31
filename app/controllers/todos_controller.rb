class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    render json: @todos
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    render json: @todo
  end

  # GET /todos/:id
  def show
    render json: @todo
  end

  # PUT /todos/:id
  def update
    todo = @todo.update(todo_params)
    render json: todo
  end

  # DELETE /todos/:id
  def destroy
    todo = @todo.destroy
    # head :no_content
    render json: todo
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
