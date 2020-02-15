class AddColumnsToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :difficulty, :string
    add_column :goals, :priority, :string
    add_column :goals, :time_commitment, :string
    add_column :goals, :time_spent, :string
    add_column :goals, :cost, :string
  end
end
