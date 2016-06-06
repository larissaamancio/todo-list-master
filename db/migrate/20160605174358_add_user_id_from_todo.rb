class AddUserIdFromTodo < ActiveRecord::Migration
  def change
    add_column :todos, :user_id, :string
    add_index  :todos, :user_id
  end
end
