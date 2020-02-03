class AddStatusToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :status, :string
  end
end
