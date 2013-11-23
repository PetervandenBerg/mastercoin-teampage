class AddPolymorpicToComments < ActiveRecord::Migration
  def change
	  change_table :comments do |t|
	    t.belongs_to :commentable, polymorphic: true
	  end
	  add_index :comments, [:commentable_id, :commentable_type]
	end
end
