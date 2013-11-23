class AddAttachmentImageToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :resources, :image
  end
end
