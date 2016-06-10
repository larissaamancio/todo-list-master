class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo
end

def owns?(todo_list)
  self.id == todo_list.user_id
end