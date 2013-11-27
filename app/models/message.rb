class Message < ActiveRecord::Base
  has_many :notifications
  has_many :users, through: :notifications
  has_many :comments, as: :commentable

  belongs_to :author, class_name: "User", foreign_key: :user_id

  accepts_nested_attributes_for :notifications
end
