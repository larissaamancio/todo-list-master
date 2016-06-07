class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.create(todo_id: params[:todo_id], user: current_user)
    respond_to do |format|
      format.html do
        if @bookmark.save
          flash[:notice] = "Todo has been favorited"
        else
          flash[:alert] = "Something went wrong...*so sad*"
        end
        redirect_to todos_path
      end
      format.js do
        @bookmark.save
      end
    end
  end

  def destroy
    Bookmark.where(todo_id: params[:id], user_id: current_user.id).first.destroy
    redirect_to :back, notice: 'Todo is no longer in favorites'
  end
end