class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :role
    end
  end
end
