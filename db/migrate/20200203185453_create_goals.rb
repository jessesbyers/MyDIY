class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :description
      t.integer :budget
      t.string :status
      t.integer :project_id
      t.timestamps
    end
  end
end
