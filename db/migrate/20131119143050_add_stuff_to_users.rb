class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_description, :string
    add_column :users, :name, :string
    add_column :users, :description, :text
  end
end
