class CreateNewsitems < ActiveRecord::Migration
  def change
    create_table :newsitems do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end
end
