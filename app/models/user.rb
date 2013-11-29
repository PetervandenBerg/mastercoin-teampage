class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "86x86>" }

  validates :name, presence: true

	has_many :resources, :dependent => :destroy
  has_many :blogs, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :newsitems, :dependent => :destroy

  has_many :messages, through: :notifications
  has_many :notifications

  def somekind_of_admin?
    if self.kind == "Admin"
      return true
    else 
      return false
    end
  end 
end
