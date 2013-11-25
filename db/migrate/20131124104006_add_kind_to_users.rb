class AddKindToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :integer
  end
end
