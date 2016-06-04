class Todo < ActiveRecord::Base
  validates_presence_of :description, :title
  has_many :items

  scope :most_recent, order("created_at DESC")

end
