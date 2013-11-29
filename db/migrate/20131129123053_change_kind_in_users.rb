class ChangeKindInUsers < ActiveRecord::Migration
  def change
    change_column :users, :kind, :string, default: "Newbie"
  end
end
