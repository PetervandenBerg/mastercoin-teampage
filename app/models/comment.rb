class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :blog
  belongs_to :message
  belongs_to :comment
  belongs_to :newsitem
	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable
end
