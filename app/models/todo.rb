class Todo < ActiveRecord::Base
  validates_presence_of :description, :title, :user_id
  has_many :items
  belongs_to :user

  scope :most_recent, ->{order("created_at DESC")}


end
