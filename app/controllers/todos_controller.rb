class TodosController < ApplicationController
  # before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :authorize_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    @todos = Todo.most_recent.includes(:user).all
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def new
    # @todo = Todo.new
     @todo = current_user.todos.build

  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def create

    @todo = current_user.todos.build(todo_params)

    # @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @todo = current_user.todos.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @todo.destroy
    @todo = current_user.todos.find(todo_params)
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public
    @todos = Todo.where(:public => true).most_recent.includes(:user).all
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :description, :public, :user)

    end

    def authorize_user
      unless current_user
        redirect_to root_path, alert: "You need to login to continue."
      end
    end
end

