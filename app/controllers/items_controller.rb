class ItemsController < ApplicationController

  def create
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.build(item_params)
    if @item.save
      flash[:notice] = "Item was created with success!"
    else
      flash[:alert] = "Please fill in all fields to create a item."
    end    
    redirect_to @todo
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @item.job, notice: "item destroyed with success."
  end

  private

  def item_params
    params.require(:item).permit(:name, :todo_id)

  end
end

