class AddAttachmentImageToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :blogs, :image
  end
end
