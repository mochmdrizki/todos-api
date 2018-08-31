class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    render json: @todo.items
  end

  # GET /todos/:todo_id/items/:id
  def show
    render json: @item
  end

  # POST /todos/:todo_id/items
  def create
    item = @todo.items.create!(item_params)
    render json: item
  end

  # PUT /todos/:todo_id/items/:id
  def update
    item = @item.update(item_params)
    render json: item
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    item = @item.destroy
    render json: item
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end
end
