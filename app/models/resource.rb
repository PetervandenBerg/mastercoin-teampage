class Resource < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { medium: "268x400>"}
	validates_attachment :image, presence: true,
						content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }
end
