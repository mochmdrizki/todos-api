class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  api :GET, '/todos/:todo_id/items/', 'Show all items'
  param :todo_id, String, desc: "Todo ID"
  formats ['json']
  def index
    render json: @todo.items
  end

  api :GET, '/todos/:todo_id/items/:id/', 'Show item detail'
  param :todo_id, String, desc: "Todo ID"
  param :id, String, desc: "Item ID"
  formats ['json']
  def show
    render json: @item
  end

  api :POST, '/todos/:todo_id/items/', 'Create item'
  param :todo_id, String, desc: "Todo ID"
  formats ['json']
  def create
    item = @todo.items.create!(item_params)
    render json: item
  end

  # PUT /todos/:todo_id/items/:id
  api :PUT, '/todos/:todo_id/items/:id/', 'Update item'
  param :todo_id, String, desc: "Todo ID"
  param :id, String, desc: "Item ID"
  formats ['json']
  def update
    item = @item.update(item_params)
    render json: item
  end

  # DELETE /todos/:todo_id/items/:id
  api :DELETE, '/todos/:todo_id/items/:id/', 'Delete item'
  param :todo_id, String, desc: "Todo ID"
  param :id, String, desc: "Item ID"
  formats ['json']
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
