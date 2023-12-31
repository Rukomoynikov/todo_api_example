# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show update destroy]

  # GET /todo_lists
  def index
    @todo_lists = TodoList.all

    render json: @todo_lists
  end

  # GET /todo_lists/1
  def show
    render json: @todo_list, include: [:todo_items]
  end

  # POST /todo_lists
  def create
    @todo_list = TodoList.new(todo_list_params.to_h.update(account: current_account))

    if @todo_list.save
      render json: @todo_list, status: :created, location: @todo_list
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todo_lists/1
  def update
    if @todo_list.update(todo_list_params)
      render json: @todo_list
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todo_lists/1
  def destroy
    @todo_list.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_list_params
    params.require(:todo_list).permit(:title, :account_id)
  end
end
