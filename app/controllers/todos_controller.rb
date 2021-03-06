class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @todos = Todo.most_recent.includes(:user).where(:user_id => current_user)
  end

  def show
  end

  def new
    @todo = current_user.todos.build
  end

  def edit
  end

  def create
    @todo = current_user.todos.build(todo_params)

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
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def is_done
    @todo = Todo.find(params[:todo_id])
    @todo.done = true

    respond_to do |format|
      format.html do
        if @todo.save
          flash[:notice] = "Item was created with success!"
        else
          flash[:alert] = "Please fill in all fields to create a item."
        end    
        redirect_to todos_path
      end

      format.js do
        @todo.save
      end
    end
  end

  def public
    @todos = Todo.where(:public => true).most_recent.includes(:user).all
  end

  def bookmarks
    @bm = Bookmark.where(:user_id => current_user)
    @todos = []
    @bm.each do |teste|
      @todos << teste.todo
    end
  end

  private
    def set_todo
      @todo = current_user.todos.find(params[:id])
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