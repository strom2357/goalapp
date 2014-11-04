class UpdateGoal < ActiveRecord::Migration
  def change
  	add_column :goals, :private, :boolean, default: true
  end
end
