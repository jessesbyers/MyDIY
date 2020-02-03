class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :address
      t.integer :user_id
      t.integer :goal_id
      t.timestamps
    end
  end
end
