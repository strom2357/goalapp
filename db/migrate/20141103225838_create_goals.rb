class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
    	t.string :title
    	t.string :body
    	t.string :deadline
    	t.integer :user_id

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
