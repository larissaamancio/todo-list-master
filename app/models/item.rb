class Item < ActiveRecord::Base
  validates_presence_of :name, :todo_id
  belongs_to :todo
end
