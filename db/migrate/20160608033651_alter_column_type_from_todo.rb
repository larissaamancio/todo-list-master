class AlterColumnTypeFromTodo < ActiveRecord::Migration
  def up
    change_table :todos do |t|
      t.change :user_id, :integer
    end
  end
end
