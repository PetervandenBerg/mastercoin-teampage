class AddLinkedInLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linked_in, :string
  end
end
