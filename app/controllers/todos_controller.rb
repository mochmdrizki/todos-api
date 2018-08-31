class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  api :GET, '/todos/', 'Show all todos'
  formats ['json']
  def index
    @todos = Todo.all
    render json: @todos
  end

  api :GET, '/todos/:id/', 'Show todo detail'
  param :id, String, desc: "Todo ID"
  formats ['json']
  def show
    render json: @todo
  end

  api :POST, '/todos/', 'Create todo'
  formats ['json']
  def create
    @todo = Todo.create!(todo_params)
    render json: @todo
  end

  api :PUT, '/todos/:id/', 'Update todo'
  param :id, String, desc: "Todo ID"
  formats ['json']
  def update
    todo = @todo.update(todo_params)
    render json: todo
  end

  api :DELETE, '/todos/:id/', 'Delete todo'
  param :id, String, desc: "Todo ID"
  formats ['json']
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
