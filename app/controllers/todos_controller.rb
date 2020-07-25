class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.order(:id).page params[:page]
    render json: { todos: @todos.map(&:as_api_json) }
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo.as_api_json
    else
      render json: { status: 400, errors: @todo.errors.as_json }, status: :bad_request
    end
  end

  def update
    if @todo.present?
      if @todo.update(todo_params)
        render json: @todo.as_api_json
      else
        render json: { status: 400, errors: @todo.errors.as_json }, status: :bad_request
      end
    else
      render json: { status: 404, errors: "Not found" }, status: :not_found
    end
  end

  def show
    render json: @todo.as_api_json
  end

  def destroy
    if @todo.present?
      if @todo.destroy
        render json: { status: "success", description: "no error" }
      else
        render json: { status: 400, errors: @todo.errors.as_json }, status: :bad_request
      end
    end
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.permit(:title, :description, :finished)
    end
end
